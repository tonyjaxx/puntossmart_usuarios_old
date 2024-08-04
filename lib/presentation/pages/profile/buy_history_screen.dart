import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/pages/profile/controller/package_controller.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuyHistoryScreen extends StatefulWidget {
  BuyHistoryScreen({
    super.key,
  });

  @override
  State<BuyHistoryScreen> createState() => _BuyHistoryScreenState();
}

class _BuyHistoryScreenState extends State<BuyHistoryScreen> {
  PackageController packageController = Get.put(PackageController());
  int points = 0;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _refreshPackages() async {
    await packageController.getBuyHistory();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
          backgroundColor: AppStyle.bgGrey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppStyle.bgGrey,
            leading: IconButton(
              splashRadius: 18.0,
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                isLtr
                    ? FlutterRemix.arrow_left_s_line
                    : FlutterRemix.arrow_right_s_line,
                size: 24.0,
                color: AppStyle.black,
              ),
            ),
            title: Text(
              AppLocalizations.of(context)!.history_puntos,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
                color: AppStyle.black,
                letterSpacing: -0.4,
              ),
            ),
          ),
          body: Obx(() {
            if (packageController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppStyle.brandGreen,
                ),
              );
            }

            final history =
                packageController.buyHistoryModel.value?.history ?? [];

            if (history.isEmpty) {
              return Center(
                child: Text(
                  'No History Found',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: AppStyle.black,
                  ),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _refreshPackages,
              child: ListView.builder(
                padding: EdgeInsets.all(16.r),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final buy = history[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Color(int.parse("0xff${buy.package?.bgColor}")),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                intl.DateFormat("MMM dd,yyyy h:mm a").format(
                                  DateTime.tryParse(buy.createdAt ?? "")
                                          ?.toLocal() ??
                                      DateTime.now(),
                                ),
                                style: AppStyle.interRegular(
                                  size: 12.sp,
                                  color: AppStyle.textGrey,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                buy.package?.packageName ?? "",
                                style: AppStyle.interRegular(
                                  size: 16.sp,
                                  color: AppStyle.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(color: AppStyle.textGrey),
                        Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppHelpers.getTranslation(
                                        AppLocalizations.of(context)!
                                            .payment_date),
                                    style: AppStyle.interRegular(
                                      size: 12.sp,
                                      color: AppStyle.textGrey,
                                    ),
                                  ),
                                  Text(
                                    intl.DateFormat("dd/MM/yyyy").format(
                                      DateTime.tryParse(buy.createdAt ?? "")
                                              ?.toLocal() ??
                                          DateTime.now(),
                                    ),
                                    style: AppStyle.interRegular(
                                      size: 16.sp,
                                      color: AppStyle.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppHelpers.getTranslation(
                                        AppLocalizations.of(context)!.points),
                                    style: AppStyle.interRegular(
                                      size: 12.sp,
                                      color: AppStyle.textGrey,
                                    ),
                                  ),
                                  Text(
                                    AppHelpers.numberFormat(
                                        number: buy.package?.points ?? 0),
                                    style: AppStyle.interRegular(
                                      size: 16.sp,
                                      color: AppStyle.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppHelpers.getTranslation(
                                        AppLocalizations.of(context)!.price),
                                    style: AppStyle.interRegular(
                                      size: 12.sp,
                                      color: AppStyle.textGrey,
                                    ),
                                  ),
                                  Text(
                                    "${buy.package?.pens ?? 0} PEN",
                                    style: AppStyle.interRegular(
                                      size: 16.sp,
                                      color: AppStyle.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppHelpers.getTranslation(
                                        AppLocalizations.of(context)!.status),
                                    style: AppStyle.interRegular(
                                      size: 12.sp,
                                      color: AppStyle.textGrey,
                                    ),
                                  ),
                                  Text(
                                    buy.status == 1
                                        ? AppHelpers.getTranslation(
                                            AppLocalizations.of(context)!
                                                .approved)
                                        : buy.status == 2
                                            ? AppHelpers.getTranslation(
                                                AppLocalizations.of(context)!
                                                    .status)
                                            : AppHelpers.getTranslation(
                                                AppLocalizations.of(context)!
                                                    .pending),
                                    style: AppStyle.interRegular(
                                      size: 16.sp,
                                      color: AppStyle.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          })),
    );
  }
}
