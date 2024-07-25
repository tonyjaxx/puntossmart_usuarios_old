// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puntossmart/application/language/language_provider.dart';
import 'package:puntossmart/application/main/main_provider.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/buttons/social_button.dart';
import 'package:puntossmart/presentation/pages/auth/register/register_page.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import 'package:upgrader/upgrader.dart';
import '../../../theme/theme.dart';
import '../../profile/language_page.dart';
import 'login_screen.dart';
import '../../../../application/login/login_provider.dart';
import 'package:puntossmart/generated/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(loginProvider.notifier).checkLanguage(context);
    });
    initDynamicLinks();
    super.initState();
  }

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      String link = dynamicLinkData.link
          .toString()
          .substring(dynamicLinkData.link.toString().indexOf("shop") + 4);
      if (link.toString().contains("product") ||
          link.toString().contains("shop") ||
          link.toString().contains("restaurant")) {
        if (AppConstants.isDemo) {
          context.replaceRoute(UiTypeRoute());
          return;
        }
        context.replaceRoute(const MainRoute());
      }
    }).onError((error) {
      debugPrint(error.message);
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink.toString().contains("product") ||
        deepLink.toString().contains("shop") ||
        deepLink.toString().contains("restaurant")) {
      if (AppConstants.isDemo) {
        context.replaceRoute(UiTypeRoute());
        return;
      }
      context.replaceRoute(const MainRoute());
    }
  }

  void selectLanguage() {
    AppHelpers.showCustomModalBottomSheet(
        isDismissible: false,
        isDrag: false,
        context: context,
        modal: LanguageScreen(
          onSave: () {
            Navigator.pop(context);
          },
        ),
        isDarkMode: false);
  }

  @override
  Widget build(BuildContext context) {
    final event = ref.read(loginProvider.notifier);
    ref.watch(languageProvider);
    ref.listen(loginProvider, (previous, next) {
      if (!next.isSelectLanguage &&
          !((previous?.isSelectLanguage ?? false) == next.isSelectLanguage)) {
        selectLanguage();
      }
    });

    final bool isDarkMode = LocalStorage.getAppThemeMode();
    final bool isLtr = LocalStorage.getLangLtr();
    return UpgradeAlert(
      child: Directionality(
        textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor:
              isDarkMode ? AppStyle.dontHaveAnAccBackDark : AppStyle.white,
          body: Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/bg.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  )),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: isDarkMode
                    ? const BoxDecoration(
                        color: AppStyle.dontHaveAnAccBackDark,
                      )
                    : BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.shade200.withOpacity(0.7),
                            Colors.black.withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              ref.read(mainProvider.notifier).selectIndex(0);
                              if (AppConstants.isDemo) {
                                context.pushRoute(UiTypeRoute());
                                return;
                              }
                              context.replaceRoute(const MainRoute());
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12, //10
                                vertical: 7, //5
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(AppLocalizations.of(context)!.skip,
                                //AppHelpers.getTranslation(TrKeys.skip),
                                style: AppStyle.interSemi(
                                  size: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        60.verticalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //"Welcome To",
                              AppLocalizations.of(context)!.auth_login_welcome,
                              style: AppStyle.interSemi(size: 32),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              // AppHelpers.getAppName() ?? "",
                              // style: AppStyle.interSemi(
                              //   size: 28,
                              //   color: AppStyle.brandGreen,
                              // ),
                              AppLocalizations.of(context)!.puntos_smart,
                              style: AppStyle.bungee(size: 34),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              //"The Largest Points & Discounts\nNetwork in Peru.",
                              AppLocalizations.of(context)!.auth_login_description,
                              style: AppStyle.interRegular(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // SafeArea(
                //   child: Padding(
                //     padding: REdgeInsets.symmetric(horizontal: 16.w),
                //     child: Column(
                //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             Expanded(
                // child:
                //             ),
                //             10.horizontalSpace,
                //             const Spacer(),

                //           ],
                //         ),
                //         Column(
                //           children: [
                //             CustomButton(
                //               title: AppHelpers.getTranslation(TrKeys.login),
                //               onPressed: () {
                // AppHelpers.showCustomModalBottomSheet(
                //   context: context,
                //   modal: const LoginScreen(),
                //   isDarkMode: isDarkMode,
                // );
                //               },
                //             ),
                // 10.verticalSpace,
                // CustomButton(
                //   title: AppHelpers.getTranslation(TrKeys.register),
                //   onPressed: () {
                // AppHelpers.showCustomModalBottomSheet(
                //     context: context,
                //     modal: const RegisterPage(
                //       isOnlyEmail: true,
                //     ),
                //     isDarkMode: isDarkMode,
                //     paddingTop:
                //         MediaQuery.of(context).padding.top);
                //   },
                //   // background: AppStyle.transparent,
                //   textColor: AppStyle.white,
                //   borderColor: AppStyle.white,
                // ),
                //             22.verticalSpace,
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 1,
                              width: 100,
                              color: AppStyle.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              //AppHelpers.getTranslation(TrKeys.login),
                              AppLocalizations.of(context)!.auth_login_3,
                              style: AppStyle.interRegular(
                                color: AppStyle.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 1,
                              width: 100,
                              color: AppStyle.white,
                            ),
                          ],
                        ),
                      ),
                      22.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SocialButton(
                              iconData: FlutterRemix.apple_fill,
                              onPressed: () {
                                event.loginWithApple(context);
                              },
                              title: "Apple"),
                          // SocialButton(
                          //     iconData: FlutterRemix.facebook_fill,
                          //     onPressed: () {
                          //       event.loginWithFacebook(context);
                          //     },
                          //     title: "Facebook"),
                          SocialButton(
                              iconData: FlutterRemix.google_fill,
                              onPressed: () {
                                event.loginWithGoogle(context);
                              },
                              title: "Google"),
                        ],
                      ),
                      10.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8,
                        ),
                        child: CustomButton(
                          //title: "Register with Your Email Or Number",
                          title: AppLocalizations.of(context)!.auth_login_register,
                          onPressed: () {
                            AppHelpers.showCustomModalBottomSheet(
                                context: context,
                                modal: const RegisterPage(
                                  isOnlyEmail: true,
                                ),
                                isDarkMode: isDarkMode,
                                paddingTop: MediaQuery.of(context).padding.top);
                          },
                          textColor: AppStyle.white,
                          borderColor: AppStyle.white,
                          background: Colors.transparent,
                          radius: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.auth_login_login,
                            //"Do you already have an account?",
                            style: TextStyle(
                              color: AppStyle.white,
                            ),
                          ),
                          3.horizontalSpace,
                          GestureDetector(
                            onTap: () {
                              AppHelpers.showCustomModalBottomSheet(
                                context: context,
                                modal: const LoginScreen(),
                                isDarkMode: isDarkMode,
                              );
                            },
                            child: Text(AppLocalizations.of(context)!.auth_login_2,
                              //AppHelpers.getTranslation(TrKeys.login),
                              style: TextStyle(
                                  color: AppStyle.white,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
