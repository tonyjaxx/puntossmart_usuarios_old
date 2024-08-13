import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puntossmart/application/register/register_provider.dart';
import 'package:puntossmart/generated/l10n.dart';
import 'package:puntossmart/infrastructure/models/data/user.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/app_bars/app_bar_bottom_sheet.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/buttons/social_button.dart';
import 'package:puntossmart/presentation/components/keyboard_dismisser.dart';
import 'package:puntossmart/presentation/components/text_fields/outline_bordered_text_field.dart';
import '../../../theme/theme.dart';
import '../confirmation/register_confirmation_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class RegisterPage extends ConsumerWidget {
  final bool isOnlyEmail;

  const RegisterPage({
    super.key,
    required this.isOnlyEmail, //si es solo con correo
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.read(registerProvider.notifier);
    final state = ref.watch(registerProvider);
    final bool isDarkMode = LocalStorage.getAppThemeMode();
    final bool isLtr = LocalStorage.getLangLtr();

    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Container(
          margin: MediaQuery.of(context).viewInsets,
          decoration: BoxDecoration(
              color: AppStyle.bgGrey.withOpacity(0.96),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              )),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      AppBarBottomSheet(
                        title: AppHelpers.getTranslation(
                            AppLocalizations.of(context)!
                                .auth_register /*TrKeys.register*/),
                      ),
                      isOnlyEmail
                          ? OutlinedBorderTextField(
                              label: AppHelpers.getTranslation(AppLocalizations
                                          .of(context)!
                                      .email_or_phone_number /*TrKeys.emailOrPhoneNumber*/)
                                  .toUpperCase(),
                              onChanged: event.setEmail,
                              isError: state.isEmailInvalid,
                              descriptionText: state.isEmailInvalid
                                  ? AppHelpers.getTranslation(AppLocalizations
                                          .of(context)!
                                      .email_invalid /*TrKeys.emailIsNotValid*/)
                                  : null,
                            )
                          : const SizedBox.shrink(),
                      isOnlyEmail
                          ? const SizedBox.shrink()
                          : Column(
                              children: [
                                (state.verificationId.isEmpty)
                                    ? 30.verticalSpace
                                    : 0.verticalSpace,
                                (state.verificationId.isEmpty)
                                    ? OutlinedBorderTextField(
                                        label: AppHelpers.getTranslation(
                                                AppLocalizations.of(context)!
                                                    .phone_number)
                                            .toUpperCase(),
                                        onChanged: event.setPhone,
                                      )
                                    : const SizedBox.shrink(),
                                30.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: (MediaQuery.sizeOf(context).width -
                                              40) /
                                          2,
                                      child: OutlinedBorderTextField(
                                        label: AppHelpers.getTranslation(
                                                AppLocalizations.of(context)!
                                                    .firstname)
                                            .toUpperCase(),
                                        onChanged: (name) =>
                                            event.setFirstName(name),
                                      ),
                                    ),
                                    SizedBox(
                                      width: (MediaQuery.sizeOf(context).width -
                                              40) /
                                          2,
                                      child: OutlinedBorderTextField(
                                        label: AppHelpers.getTranslation(
                                                AppLocalizations.of(context)!
                                                    .surname)
                                            .toUpperCase(),
                                        onChanged: (name) =>
                                            event.setLatName(name),
                                      ),
                                    ),
                                  ],
                                ),
                                30.verticalSpace,
                                OutlinedBorderTextField(
                                  label: AppHelpers.getTranslation(
                                          AppLocalizations.of(context)!
                                              .password)
                                      .toUpperCase(),
                                  obscure: state.showPassword,
                                  suffixIcon: IconButton(
                                    splashRadius: 25,
                                    icon: Icon(
                                      state.showPassword
                                          ? FlutterRemix.eye_line
                                          : FlutterRemix.eye_close_line,
                                      color: isDarkMode
                                          ? AppStyle.black
                                          : AppStyle.hintColor,
                                      size: 20.r,
                                    ),
                                    onPressed: () => event.toggleShowPassword(),
                                  ),
                                  onChanged: (name) => event.setPassword(name),
                                  isError: state.isPasswordInvalid,
                                  descriptionText: state.isPasswordInvalid
                                      ? AppHelpers.getTranslation(
                                          AppLocalizations.of(context)!
                                              .password_minimum_8_characters)
                                      : null,
                                ),
                                34.verticalSpace,
                                OutlinedBorderTextField(
                                  label: AppHelpers.getTranslation(
                                          AppLocalizations.of(context)!
                                              .confirm_password)
                                      .toUpperCase(),
                                  obscure: state.showConfirmPassword,
                                  suffixIcon: IconButton(
                                    splashRadius: 25,
                                    icon: Icon(
                                      state.showConfirmPassword
                                          ? FlutterRemix.eye_line
                                          : FlutterRemix.eye_close_line,
                                      color: isDarkMode
                                          ? AppStyle.black
                                          : AppStyle.hintColor,
                                      size: 20.r,
                                    ),
                                    onPressed: () =>
                                        event.toggleShowConfirmPassword(),
                                  ),
                                  onChanged: (name) =>
                                      event.setConfirmPassword(name),
                                  isError: state.isConfirmPasswordInvalid,
                                  descriptionText:
                                      state.isConfirmPasswordInvalid
                                          ? AppHelpers.getTranslation(
                                              AppLocalizations.of(context)!
                                                  .password_is_not_the_same)
                                          : null,
                                ),
                                // 30.verticalSpace,
                                // OutlinedBorderTextField(
                                //   label:
                                //       AppHelpers.getTranslation(AppLocalizations.of(context)!.referral)
                                //           .toUpperCase(),
                                //   onChanged: event.setReferral,
                                // ),
                              ],
                            ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: CustomButton(
                      isLoading: state.isLoading, //btn registrar
                      title: AppHelpers.getTranslation(
                          AppLocalizations.of(context)!
                              .auth_register /*TrKeys.register*/),
                      onPressed: () {
                        isOnlyEmail
                            ? (event.checkEmail()
                                ? event.sendCode(context, () {
                                    Navigator.pop(context);
                                    AppHelpers.showCustomModalBottomSheet(
                                      context: context,
                                      modal: RegisterConfirmationPage(
                                          verificationId: "",
                                          userModel: UserModel(
                                              firstname: state.firstName,
                                              lastname: state.lastName,
                                              phone: state.phone,
                                              email: state.email,
                                              password: state.password,
                                              confirmPassword:
                                                  state.confirmPassword)),
                                      isDarkMode: isDarkMode,
                                    );
                                  })
                                : event.sendCodeToNumber(context, (s) {
                                    Navigator.pop(context);
                                    AppHelpers.showCustomModalBottomSheet(
                                      context: context,
                                      modal: RegisterConfirmationPage(
                                          verificationId: s,
                                          userModel: UserModel(
                                              firstname: state.firstName,
                                              lastname: state.lastName,
                                              phone: state.phone,
                                              email: state.email,
                                              password: state.password,
                                              confirmPassword:
                                                  state.confirmPassword)),
                                      isDarkMode: isDarkMode,
                                    );
                                  }))
                            : state.verificationId.isEmpty
                                ? event.register(
                                    context,
                                  )
                                : event.registerWithPhone(context);
                      },
                    ),
                  ),
                  isOnlyEmail
                      ? Column(
                          children: [
                            32.verticalSpace,
                            Row(children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: AppStyle.black.withOpacity(0.5),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 12, left: 12),
                                child: Text(
                                  AppHelpers.getTranslation(AppLocalizations.of(
                                          context)!
                                      .auth_login_4 /*TrKeys.orAccessQuickly*/),
                                  style: AppStyle.interNormal(
                                    size: 12.sp,
                                    color: AppStyle.textGrey,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                color: AppStyle.black.withOpacity(0.5),
                              )),
                            ]),
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
                            22.verticalSpace,
                          ],
                        )
                      : SizedBox(
                          height: 32.h,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
