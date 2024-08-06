// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:puntossmart/application/profile/profile_provider.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/custom_network_image.dart';
import 'package:puntossmart/presentation/components/loading.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import 'package:intl/intl.dart' as intl;

import '../../../infrastructure/services/local_storage.dart';
import '../../components/app_bars/common_app_bar.dart';
import '../../components/buttons/pop_button.dart';
import '../../theme/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ShareReferralPage extends ConsumerStatefulWidget {
  const ShareReferralPage({super.key});

  @override
  ConsumerState<ShareReferralPage> createState() => _ShareReferralPageState();
}

class _ShareReferralPageState extends ConsumerState<ShareReferralPage> {
  late RefreshController controller;
  final bool isLtr = LocalStorage.getLangLtr();

  @override
  void initState() {
    controller = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).fetchReferral(context);
    });
    super.initState();
  }

  final List<Map<String, String>> data = [
    {'date': '07/08/2020 04:00 PM', 'name': 'Bryan Rafael Andia'},
    {'date': '01/08/2020 04:30 PM', 'name': 'Nicole Karen'},
    {'date': '02/08/2020 05:00 PM', 'name': 'Piero '},
    {'date': '06/08/2020 04:00 PM', 'name': 'Tony Agustin'},
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);

    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppStyle.bgGrey,
        body: Column(
          children: [
            CommonAppBar(
              child: Text(
                AppHelpers.getTranslation(
                    AppLocalizations.of(context)!.shared_friends),
                style: AppStyle.interNoSemi(
                  size: 18,
                  color: AppStyle.black,
                ),
              ),
            ),
            Expanded(
              child: state.isReferralLoading
                  ? const Loading()
                  : Padding(
                      padding: EdgeInsets.all(16.r),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 200.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppStyle.textGrey,
                                    offset: Offset(5, 5),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: CustomNetworkImage(
                                url: state.referralData?.img ?? "",
                                height: 42.r,
                                width: 42.r,
                                radius: 8.r,
                              ),
                            ),
                            16.verticalSpace,
                            Text(
                              state.referralData?.translation?.title ?? "",
                              style: AppStyle.bungee(
                                size: 20,
                                color: AppStyle.newThemeColor,
                              ),
                            ),
                            5.verticalSpace,
                            GestureDetector(
                              onTap: () {
                                context.pushRoute(ShareReferralFaqRoute(
                                    terms: state.referralData?.translation
                                            ?.shortDesc ??
                                        ""));
                              },
                              child: RichText(
                                text: TextSpan(
                                    text:
                                        "${state.referralData?.translation?.description} ",
                                    style: AppStyle.interNoSemi(
                                      size: 14,
                                      color: AppStyle.textGrey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: AppHelpers.getTranslation(
                                                AppLocalizations.of(context)!
                                                    .referral_faq)
                                            .toLowerCase(),
                                        style: AppStyle.interNoSemi(
                                            size: 14,
                                            color: AppStyle.black,
                                            decoration:
                                                TextDecoration.underline),
                                      )
                                    ]),
                              ),
                            ),
                            16.verticalSpace,
                            CustomButton(
                                title: AppHelpers.getTranslation(
                                    AppLocalizations.of(context)!.share),
                                onPressed: () {
                                  FlutterShare.share(
                                      title: AppHelpers.getTranslation(
                                          AppLocalizations.of(context)!
                                              .shared_friends),
                                      linkUrl: ref
                                              .watch(profileProvider)
                                              .userData
                                              ?.referral ??
                                          "");
                                }),
                            16.verticalSpace,
                            CustomButton(
                                background: AppStyle.transparent,
                                borderColor: AppStyle.black,
                                title: AppHelpers.getTranslation(
                                    AppLocalizations.of(context)!.copy_code),
                                onPressed: () async {
                                  await Clipboard.setData(ClipboardData(
                                      text: ref
                                              .watch(profileProvider)
                                              .userData
                                              ?.referral ??
                                          ""));
                                  AppHelpers.showCheckTopSnackBarDone(
                                      context,
                                      AppHelpers.getTranslation(
                                          AppLocalizations.of(context)!
                                              .copy_code));
                                }),
                            16.verticalSpace,
                            Container(
                              height: 74.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: AppStyle.black),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: REdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FlutterRemix.coins_fill,
                                      size: 45.r,
                                      color: AppStyle.black,
                                    ),
                                    10.horizontalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          AppHelpers.getTranslation(
                                              AppLocalizations.of(context)!
                                                  .balance),
                                          style: AppStyle.interNormal(
                                            size: 14.sp,
                                            color: AppStyle.black,
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                        Text(
                                          AppHelpers.numberFormat(
                                              number: (state.userData
                                                          ?.referralFromPrice ??
                                                      0) -
                                                  (state.userData
                                                          ?.referralFromWithdrawPrice ??
                                                      0)),
                                          style: AppStyle.interSemi(
                                            size: 18.sp,
                                            color: AppStyle.black,
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 1.r,
                                      height: 46.r,
                                      color: AppStyle.black,
                                    ),
                                    const Spacer(),
                                    Text(
                                      ((state.userData?.referralFromPrice ??
                                                  0) -
                                              (state.userData
                                                      ?.referralFromWithdrawPrice ??
                                                  0))
                                          .toString(),
                                      style: AppStyle.interSemi(
                                        size: 18.sp,
                                        color: AppStyle.black,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            16.verticalSpace,
                            SizedBox(
                              height: 400.h, // Altura máxima para el ListView
                              child: Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    final item = data[index];
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 16.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.topLeft,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(16.r),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    intl.DateFormat(
                                                            "dd/MM/yyyy h:mm a")
                                                        .format(
                                                      DateTime.tryParse(
                                                                  item['date']!)
                                                              ?.toLocal() ??
                                                          DateTime.now(),
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Text(
                                                    item['name']!,
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const PopButton(),
        ),
      ),
    );
  }
}
