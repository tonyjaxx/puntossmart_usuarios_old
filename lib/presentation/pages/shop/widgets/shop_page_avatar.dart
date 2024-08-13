import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:puntossmart/application/shop_order/shop_order_provider.dart';
import 'package:puntossmart/infrastructure/models/data/shop_data.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/badge_item.dart';
import 'package:puntossmart/presentation/components/buttons/animation_button_effect.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/custom_network_image.dart';
import 'package:puntossmart/presentation/components/shop_avarat.dart';
import 'package:puntossmart/presentation/pages/shop/group_order/group_order.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import 'package:puntossmart/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../infrastructure/models/data/bonus_data.dart';
import '../../../components/bonus_discount_popular.dart';
import 'bonus_screen.dart';
import 'shop_description_item.dart';

class ShopPageAvatar extends StatelessWidget {
  final ShopData shop;
  final String? cartId;
  final String? userUuid;
  final String workTime;
  final bool isLike;
  final VoidCallback onShare;
  final VoidCallback onLike;
  final BonusModel? bonus;

  const ShopPageAvatar(
      {super.key,
      required this.shop,
      required this.onLike,
      required this.workTime,
      required this.isLike,
      required this.onShare,
      required this.bonus,
      this.cartId,
      this.userUuid});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        shopAppBar(context),
        8.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    (shop.translation?.title?.length ?? 0) > 28
                        ? "${shop.translation?.title?.substring(0, 28) ?? " "}.."
                        : shop.translation?.title ?? "",
                    style: AppStyle.interSemi(
                      size: 21,
                      color: AppStyle.black,
                    ),
                  ),
                  if (shop.verify == 1)
                    Padding(
                      padding: EdgeInsets.only(left: 4.r),
                      child: const BadgeItem(),
                    ),
                ],
              ),
              Text(
                shop.translation?.description ?? "",
                style: AppStyle.interNormal(
                  size: 13,
                  color: AppStyle.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              6.verticalSpace,
              GestureDetector(
                onTap: () {
                  context.pushRoute(
                      ShopDetailRoute(shop: shop, workTime: workTime));
                },
                child: Text(
                  AppHelpers.getTranslation(
                      AppLocalizations.of(context)!.more_info),
                  style: AppStyle.interNormal(
                      size: 14,
                      color: AppStyle.black,
                      textDecoration: TextDecoration.underline),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              6.verticalSpace,
              Row(
                children: [
                  SvgPicture.asset("assets/svgs/star.svg"),
                  4.horizontalSpace,
                  Text(
                    (shop.avgRate ?? ""),
                    style: AppStyle.interNormal(
                      size: 12.sp,
                      color: AppStyle.black,
                    ),
                  ),
                  8.horizontalSpace,
                  BonusDiscountPopular(
                    isSingleShop: true,
                    isPopular: shop.isRecommend ?? false,
                    bonus: shop.bonus,
                    isDiscount: shop.isDiscount ?? false,
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ShopDescriptionItem(
                      title: AppHelpers.getTranslation(
                          AppLocalizations.of(context)!.working_hours),
                      description: workTime,
                      icon: const Icon(FlutterRemix.time_fill),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ShopDescriptionItem(
                      title: AppHelpers.getTranslation(
                          AppLocalizations.of(context)!.delivery_price),
                      description:
                          "${AppHelpers.getTranslation(AppLocalizations.of(context)!.from)} ${AppHelpers.numberFormat(number: shop.deliveryRange)}",
                      icon: SvgPicture.asset(
                        "assets/svgs/ticket.svg",
                        width: 18.r,
                        height: 18.r,
                      ),
                    ),
                  ),
                ],
              ),
              // Container(
              //   width:
              //       (880 / MediaQuery.of(context).size.height) * 100, //120
              //   child: ShopDescriptionItem(
              //     title: AppHelpers.getTranslation(
              //         AppLocalizations.of(context)!.delivery_time),
              //     description:
              //         "${shop.deliveryTime?.from ?? 0} - ${shop.deliveryTime?.to ?? 0} ${AppHelpers.getTranslation(shop.deliveryTime?.type ?? "min")}",
              //     icon: SvgPicture.asset("assets/svgs/delivery.svg"),
              //   ),
              // ),
              AppHelpers.getTranslation(AppLocalizations.of(context)!.close) ==
                      workTime
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                            color: AppStyle.bgGrey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          children: [
                            const Icon(
                              FlutterRemix.time_fill,
                              color: AppStyle.black,
                            ),
                            8.horizontalSpace,
                            Expanded(
                              child: Text(
                                AppHelpers.getTranslation(
                                    AppLocalizations.of(context)!
                                        .not_work_today_time),
                                style: AppStyle.interNormal(
                                  size: 14,
                                  color: AppStyle.black,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              bonus != null ? _bonusButton(context) : const SizedBox.shrink(),
              12.verticalSpace,
              if (AppHelpers.getGroupOrder()) groupOrderButton(context),
            ],
          ),
        )
      ],
    );
  }

  checkOtherShop(BuildContext context) {
    AppHelpers.showAlertDialog(
        context: context,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppHelpers.getTranslation(
                  AppLocalizations.of(context)!.all_previously_added),
              style: AppStyle.interNormal(),
              textAlign: TextAlign.center,
            ),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      title: AppHelpers.getTranslation(
                          AppLocalizations.of(context)!.cancel),
                      background: AppStyle.transparent,
                      borderColor: AppStyle.borderColor,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                10.horizontalSpace,
                Expanded(child: Consumer(builder: (contextTwo, ref, child) {
                  return CustomButton(
                      isLoading: ref.watch(shopOrderProvider).isDeleteLoading,
                      title: AppHelpers.getTranslation(
                          AppLocalizations.of(context)!.continue_),
                      onPressed: () {
                        ref
                            .read(shopOrderProvider.notifier)
                            .deleteCart(context)
                            .then((value) async {
                          ref.read(shopOrderProvider.notifier).createCart(
                                context,
                                (shop.id ?? 0),
                              );
                        });
                      });
                })),
              ],
            )
          ],
        ));
  }

  Widget groupOrderButton(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ref.listen(shopOrderProvider, (previous, next) {
        if (next.isOtherShop && next.isOtherShop != previous?.isOtherShop) {
          checkOtherShop(context);
        }
        if (next.isStartGroup && next.isStartGroup != previous?.isStartGroup) {
          AppHelpers.showCustomModalBottomSheet(
            context: context,
            modal: GroupOrderScreen(
              shop: shop,
              cartId: cartId,
            ),
            isDarkMode: false,
            isDrag: true,
            radius: 12,
          );
        }
      });
      bool isStartOrder = (ref.watch(shopOrderProvider).cart?.group ?? false) &&
          (ref.watch(shopOrderProvider).cart?.shopId == shop.id);
      return CustomButton(
        isLoading: ref.watch(shopOrderProvider).isStartGroupLoading ||
            ref.watch(shopOrderProvider).isCheckShopOrder,
        icon: Icon(
          isStartOrder
              ? FlutterRemix.list_settings_line
              : FlutterRemix.group_2_line,
          color: isStartOrder ? AppStyle.black : AppStyle.white,
        ),
        title: isStartOrder
            ? AppHelpers.getTranslation(
                AppLocalizations.of(context)!.manage_orden)
            : AppHelpers.getTranslation(
                AppLocalizations.of(context)!.start_group_oder),
        background:
            isStartOrder ? AppStyle.brandGreen : AppStyle.orderButtonColor,
        textColor: isStartOrder ? AppStyle.black : AppStyle.white,
        radius: 10,
        onPressed: () {
          if (LocalStorage.getToken().isNotEmpty) {
            !isStartOrder
                ? ref.read(shopOrderProvider.notifier).createCart(
                      context,
                      shop.id ?? 0,
                    )
                : AppHelpers.showCustomModalBottomSheet(
                    paddingTop: MediaQuery.of(context).padding.top + 160.h,
                    context: context,
                    modal: GroupOrderScreen(
                      shop: shop,
                      cartId: cartId,
                    ),
                    isDarkMode: false,
                    isDrag: true,
                    radius: 12,
                  );
          } else {
            context.pushRoute(const LoginRoute());
          }
        },
      );
    });
  }

  Stack shopAppBar(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180.h + MediaQuery.of(context).padding.top,
          width: double.infinity,
          color: AppStyle.mainBack,
          child: CustomNetworkImage(
            url: shop.backgroundImg ?? "",
            height: 180.h + MediaQuery.of(context).padding.top,
            width: double.infinity,
            radius: 0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 130.h + MediaQuery.of(context).padding.top,
              left: 16.w,
              right: 16.w),
          child: ShopAvatar(
            radius: 20,
            shopImage: shop.logoImg ?? "",
            size: 70,
            padding: 6,
            bgColor: AppStyle.white.withOpacity(0.65),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top,
          right: 16.w,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (LocalStorage.getToken().isEmpty) {
                    context.replaceRoute(const LoginRoute());
                    return;
                  }
                  context.pushRoute(ChatRoute(
                      roleId: shop.id.toString(),
                      name: shop.translation?.title ?? ""));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      color: AppStyle.unselectedBottomBarItem.withOpacity(0.29),
                      child: const Center(
                        child: Icon(
                          FlutterRemix.chat_1_line,
                          color: AppStyle.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              8.horizontalSpace,
              GestureDetector(
                onTap: onLike,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      color: AppStyle.unselectedBottomBarItem.withOpacity(0.29),
                      child: Center(
                        child: Icon(
                          isLike
                              ? FlutterRemix.heart_3_fill
                              : FlutterRemix.heart_3_line,
                          color: AppStyle.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              8.horizontalSpace,
              GestureDetector(
                onTap: onShare,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      color: AppStyle.unselectedBottomBarItem.withOpacity(0.29),
                      child: const Center(
                        child: Icon(
                          FlutterRemix.share_line,
                          color: AppStyle.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  AnimationButtonEffect _bonusButton(BuildContext context) {
    return AnimationButtonEffect(
      child: GestureDetector(
          onTap: () {
            AppHelpers.showCustomModalBottomSheet(
              paddingTop: MediaQuery.of(context).padding.top,
              context: context,
              modal: BonusScreen(
                bonus: bonus,
              ),
              isDarkMode: false,
              isDrag: true,
              radius: 12,
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: 8.h),
            width: MediaQuery.of(context).size.width - 32,
            decoration: BoxDecoration(
                color: AppStyle.bgGrey,
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                Container(
                  width: 22.w,
                  height: 22.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppStyle.blueBonus),
                  child: Icon(
                    FlutterRemix.gift_2_fill,
                    size: 16.r,
                    color: AppStyle.white,
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  child: Text(
                    bonus != null
                        ? ((bonus?.type ?? "sum") == "sum")
                            ? "${AppHelpers.getTranslation(AppLocalizations.of(context)!.under)} ${AppHelpers.numberFormat(number: bonus?.value)} + ${bonus?.bonusStock?.product?.translation?.title ?? ""}"
                            : "${AppHelpers.getTranslation(AppLocalizations.of(context)!.under)} ${bonus?.value ?? 0} + ${bonus?.bonusStock?.product?.translation?.title ?? ""}"
                        : "",
                    style: AppStyle.interNormal(
                      size: 14,
                      color: AppStyle.black,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
