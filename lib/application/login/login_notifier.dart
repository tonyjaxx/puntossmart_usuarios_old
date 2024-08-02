import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:puntossmart/application/main/main_provider.dart';
import 'package:puntossmart/domain/iterface/auth.dart';
import 'package:puntossmart/domain/iterface/user.dart';
import 'package:puntossmart/infrastructure/models/data/address_new_data.dart';
import 'package:puntossmart/infrastructure/models/data/address_old_data.dart';
import 'package:puntossmart/infrastructure/models/models.dart';
import 'package:puntossmart/infrastructure/services/app_connectivity.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/app_validators.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../domain/iterface/settings.dart';
import 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthRepositoryFacade _authRepository;
  final SettingsRepositoryFacade _settingsRepository;
  final UserRepositoryFacade _userRepositoryFacade;

  LoginNotifier(
    this._authRepository,
    this._settingsRepository,
    this._userRepositoryFacade,
  ) : super(const LoginState());

  void setPassword(String text) {
    state = state.copyWith(
      password: text.trim(),
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setEmail(String text) {
    state = state.copyWith(
      email: text.trim(),
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setShowPassword(bool show) {
    state = state.copyWith(showPassword: show);
  }

  void setKeepLogin(bool keep) {
    state = state.copyWith(isKeepLogin: keep);
  }

  Future<void> checkLanguage(BuildContext context) async {
    final lang = LocalStorage.getLanguage();
    if (lang == null) {
      state = state.copyWith(isSelectLanguage: false);
    } else {
      final connect = await AppConnectivity.connectivity();
      if (connect) {
        final response = await _settingsRepository.getLanguages();
        response.when(
          success: (data) {
            state = state.copyWith(list: data.data ?? []);
            final List<LanguageData> languages = data.data ?? [];
            for (int i = 0; i < languages.length; i++) {
              if (languages[i].id == lang.id) {
                state = state.copyWith(
                  isSelectLanguage: true,
                );
                break;
              }
            }
          },
          failure: (failure, status) {
            state = state.copyWith(isSelectLanguage: false);
            AppHelpers.showCheckTopSnackBar(
              context,
              failure,
            );
          },
        );
      } else {
        if (context.mounted) {
          AppHelpers.showNoConnectionSnackBar(context);
        }
      }
    }
  }

//valida numero de celular pero no espera espacios
  checkEmail() {
    var email_ = '+51' + state.email;
    print('karne check number $email_');
    return AppValidators.checkEmail(email_);
  }

  Future<void> login(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (checkEmail()) {
        //valida correo electronico
        if (!AppValidators.isValidEmail(state.email)) {
          state = state.copyWith(isEmailNotValid: true);
          return;
        }
      }

      if (!AppValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordNotValid: true);
        return;
      }

      // Añadir prefijo +51 si el email tiene 9 dígitos
      if (state.email.length == 9 && RegExp(r'^\d{9}$').hasMatch(state.email)) {
        state = state.copyWith(email: '+51${state.email}');
      }

      state = state.copyWith(isLoading: true);
      final response = await _authRepository.login(
        email: state.email,
        password: state.password,
      );
      response.when(
        success: (data) async {
          LocalStorage.setToken(data.data?.accessToken ?? '');
          LocalStorage.setAddressSelected(AddressData(
              title: data.data?.user?.addresses?.firstWhere(
                      (element) => element.active ?? false, orElse: () {
                    return AddressNewModel();
                  }).title ??
                  "",
              address: data.data?.user?.addresses
                      ?.firstWhere((element) => element.active ?? false,
                          orElse: () {
                        return AddressNewModel();
                      })
                      .address
                      ?.address ??
                  "",
              location: LocationModel(
                  longitude: data.data?.user?.addresses
                      ?.firstWhere((element) => element.active ?? false,
                          orElse: () {
                        return AddressNewModel();
                      })
                      .location
                      ?.last,
                  latitude: data.data?.user?.addresses
                      ?.firstWhere((element) => element.active ?? false,
                          orElse: () {
                        return AddressNewModel();
                      })
                      .location
                      ?.first)));
          //knjt

          // if (AppConstants.isDemo) {
          //   context.replaceRoute(UiTypeRoute());
          // } else {
          //   context.replaceRoute(const MainRoute());
          // }
          await LocalStorage.setUiType(3);
          context.replaceRoute(const MainRoute());

          String? fcmToken = await FirebaseMessaging.instance.getToken();
          print("FIREBAE TOKEN $fcmToken");
          _userRepositoryFacade.updateFirebaseToken(fcmToken);
          state = state.copyWith(isLoading: false);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false, isLoginError: true);
          AppHelpers.showCheckTopSnackBar(
            context,
            failure,
          );
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> loginWithGoogle(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      GoogleSignInAccount? googleUser;
      try {
        googleUser = await GoogleSignIn().signIn();
      } catch (e) {
        state = state.copyWith(isLoading: false);
      }
      if (googleUser == null) {
        state = state.copyWith(isLoading: false);
        return;
      }

      final response = await _authRepository.loginWithGoogle(
        email: googleUser.email,
        displayName: googleUser.displayName ?? '',
        id: googleUser.id,
        avatar: googleUser.photoUrl ?? "",
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false);
          LocalStorage.setToken(data.data?.accessToken ?? '');
          LocalStorage.setAddressSelected(AddressData(
              title: data.data?.user?.addresses?.firstWhere(
                      (element) => element.active ?? false, orElse: () {
                    return AddressNewModel();
                  }).title ??
                  "",
              address: data.data?.user?.addresses
                      ?.firstWhere((element) => element.active ?? false,
                          orElse: () {
                        return AddressNewModel();
                      })
                      .address
                      ?.address ??
                  "",
              location: LocationModel(
                  longitude: data.data?.user?.addresses
                      ?.firstWhere((element) => element.active ?? false,
                          orElse: () {
                        return AddressNewModel();
                      })
                      .location
                      ?.last,
                  latitude: data.data?.user?.addresses
                      ?.firstWhere((element) => element.active ?? false,
                          orElse: () {
                        return AddressNewModel();
                      })
                      .location
                      ?.first)));
          context.router.popUntilRoot();
          // if (AppConstants.isDemo) {
          //   context.replaceRoute(UiTypeRoute());
          // } else {
          await LocalStorage.setUiType(3);
          context.replaceRoute(const MainRoute());
          //}
          String? fcmToken = await FirebaseMessaging.instance.getToken();
          _userRepositoryFacade.updateFirebaseToken(fcmToken);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            failure,
          );
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  // Future<void> loginWithFacebook(BuildContext context) async {
  //   final connected = await AppConnectivity.connectivity();
  //   if (connected) {
  //     state = state.copyWith(isLoading: true);
  //     final fb = FacebookLogin();
  //     debugPrint('===> login with face exceptio');
  //     try {
  //       final user = await fb.logIn(permissions: []);

  //       final OAuthCredential credential =
  //           FacebookAuthProvider.credential(user.accessToken?.token ?? "");

  //       final userObj =
  //           await FirebaseAuth.instance.signInWithCredential(credential);

  //       debugPrint(
  //           '===> login with face exception: ${user.accessToken?.declinedPermissions}');
  //       if (user.status == FacebookLoginStatus.success) {
  //         final response = await _authRepository.loginWithGoogle(
  //           email: userObj.user?.email ?? "",
  //           displayName: userObj.user?.displayName ?? "",
  //           id: userObj.user?.uid ?? "",
  //           avatar: userObj.user?.photoURL ?? "",
  //         );
  //         response.when(
  //           success: (data) async {
  //             state = state.copyWith(isLoading: false);
  //             LocalStorage.setToken(data.data?.accessToken ?? '');
  //             LocalStorage.setAddressSelected(AddressData(
  //                 title: data.data?.user?.addresses?.firstWhere(
  //                         (element) => element.active ?? false, orElse: () {
  //                       return AddressNewModel();
  //                     }).title ??
  //                     "",
  //                 address: data.data?.user?.addresses
  //                         ?.firstWhere((element) => element.active ?? false,
  //                             orElse: () {
  //                           return AddressNewModel();
  //                         })
  //                         .address
  //                         ?.address ??
  //                     "",
  //                 location: LocationModel(
  //                     longitude: data.data?.user?.addresses
  //                         ?.firstWhere((element) => element.active ?? false,
  //                             orElse: () {
  //                           return AddressNewModel();
  //                         })
  //                         .location
  //                         ?.last,
  //                     latitude: data.data?.user?.addresses
  //                         ?.firstWhere((element) => element.active ?? false,
  //                             orElse: () {
  //                           return AddressNewModel();
  //                         })
  //                         .location
  //                         ?.first)));
  //             context.router.popUntilRoot();
  //             if (AppConstants.isDemo) {
  //               context.replaceRoute(UiTypeRoute());
  //             } else {
  //               context.replaceRoute(const MainRoute());
  //             }
  //             String? fcmToken = await FirebaseMessaging.instance.getToken();
  //             _userRepositoryFacade.updateFirebaseToken(fcmToken);
  //           },
  //           failure: (failure, status) {
  //             state = state.copyWith(isLoading: false);
  //             AppHelpers.showCheckTopSnackBar(
  //               context,
  //               failure,
  //             );
  //           },
  //         );
  //       } else {
  //         state = state.copyWith(isLoading: false);
  //         if (context.mounted) {
  //           AppHelpers.showCheckTopSnackBar(
  //             context,
  //             AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
  //           );
  //         }
  //       }
  //     } catch (e) {
  //       state = state.copyWith(isLoading: false);
  //       debugPrint('===> login with face exception: $e');
  //     }
  //   } else {
  //     if (context.mounted) {
  //       AppHelpers.showNoConnectionSnackBar(context);
  //     }
  //   }
  // }

  Future<void> loginWithApple(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);

      try {
        final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );

        OAuthProvider oAuthProvider = OAuthProvider("apple.com");
        final AuthCredential credentialApple = oAuthProvider.credential(
          idToken: credential.identityToken,
          accessToken: credential.authorizationCode,
        );

        final userObj =
            await FirebaseAuth.instance.signInWithCredential(credentialApple);

        final response = await _authRepository.loginWithGoogle(
            email: credential.email ?? userObj.user?.email ?? "",
            displayName:
                credential.givenName ?? userObj.user?.displayName ?? "",
            id: credential.userIdentifier ?? userObj.user?.uid ?? "",
            avatar: userObj.user?.displayName ?? "");
        response.when(
          success: (data) async {
            state = state.copyWith(isLoading: false);
            LocalStorage.setToken(data.data?.accessToken ?? '');
            LocalStorage.setAddressSelected(AddressData(
                title: data.data?.user?.addresses?.firstWhere(
                        (element) => element.active ?? false, orElse: () {
                      return AddressNewModel();
                    }).title ??
                    "",
                address: data.data?.user?.addresses
                        ?.firstWhere((element) => element.active ?? false,
                            orElse: () {
                          return AddressNewModel();
                        })
                        .address
                        ?.address ??
                    "",
                location: LocationModel(
                    longitude: data.data?.user?.addresses
                        ?.firstWhere((element) => element.active ?? false,
                            orElse: () {
                          return AddressNewModel();
                        })
                        .location
                        ?.last,
                    latitude: data.data?.user?.addresses
                        ?.firstWhere((element) => element.active ?? false,
                            orElse: () {
                          return AddressNewModel();
                        })
                        .location
                        ?.first)));
            context.router.popUntilRoot();
            //directo al home
            // if (AppConstants.isDemo) {
            //   context.replaceRoute(UiTypeRoute());
            // } else {
            //   context.replaceRoute(const MainRoute());
            // }
            await LocalStorage.setUiType(3);
            context.replaceRoute(const MainRoute());

            String? fcmToken = await FirebaseMessaging.instance.getToken();
            _userRepositoryFacade.updateFirebaseToken(fcmToken);
          },
          failure: (failure, s) {
            state = state.copyWith(isLoading: false);
            AppHelpers.showCheckTopSnackBar(
              context,
              failure,
            );
          },
        );
      } catch (e) {
        state = state.copyWith(isLoading: false);
        debugPrint('===> login with apple exception: $e');
      }
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
