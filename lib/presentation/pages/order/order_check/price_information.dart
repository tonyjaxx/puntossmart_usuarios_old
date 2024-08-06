import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puntossmart/application/order/order_state.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'widgets/title_price.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriceInformation extends StatelessWidget {
  final bool isOrder;
  final OrderState state;

  const PriceInformation(
      {super.key, required this.isOrder, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.verticalSpace,
        TitleAndPrice(
          title:
              AppHelpers.getTranslation(AppLocalizations.of(context)!.subtotal),
          rightTitle: AppHelpers.numberFormat(
              isOrder: isOrder,
              symbol: (state.orderData?.currencyModel?.symbol),
              number: isOrder
                  ? state.orderData?.originPrice
                  : state.calculateData?.price ?? 0),
          textStyle: AppStyle.interRegular(
            size: 16,
            color: AppStyle.black,
          ),
        ),
        16.verticalSpace,
        // TitleAndPrice(//precio delivery se va , sale como precio 05-08
        //   title: AppHelpers.getTranslation(
        //       AppLocalizations.of(context)!.delivery_price),
        //   rightTitle: AppHelpers.numberFormat(
        //     symbol: state.orderData?.currencyModel?.symbol,
        //     isOrder: isOrder,
        //     number: isOrder
        //         ? (state.orderData?.deliveryFee ?? 0)
        //         : (state.calculateData?.deliveryFee ??
        //             0), //este valor cambia lo trae el servicio precio del producto
        //   ),
        //   textStyle: AppStyle.interRegular(
        //     size: 16,
        //     color: AppStyle.black,
        //   ),
        // ),
        // 16.verticalSpace,
        // TitleAndPrice(
        //   //impuesto total se va y se resta del total
        //   title: AppHelpers.getTranslation(
        //       AppLocalizations.of(context)!.total_tax),
        //   rightTitle: AppHelpers.numberFormat(
        //       isOrder: isOrder,
        //       symbol: state.orderData?.currencyModel?.symbol,
        //       number: isOrder
        //           ? ((state.orderData?.tax ?? 0))
        //           : (state.calculateData?.totalTax ?? 0)),
        //   textStyle: AppStyle.interRegular(
        //     size: 16,
        //     color: AppStyle.black,
        //   ),
        // ),
        // 16.verticalSpace,
        // TitleAndPrice(
        //   //cuota de servicio se va 05-08 knt
        //   title: AppHelpers.getTranslation(
        //       AppLocalizations.of(context)!.service_fee),
        //   rightTitle: AppHelpers.numberFormat(
        //       isOrder: isOrder,
        //       symbol: state.orderData?.currencyModel?.symbol,
        //       // number: isOrder
        //       //     ? ((state.orderData?.serviceFee ?? 0))
        //       //     : (state.calculateData?.serviceFee ??
        //       //         0)), //precio del servicio
        //       number: isOrder ? ((0)) : (0)),
        //   textStyle: AppStyle.interRegular(
        //     size: 16,
        //     color: AppStyle.black,
        //   ),
        // ),
        // 16.verticalSpace,
        if (isOrder
            ? state.orderData?.totalDiscount != null
            : state.calculateData?.totalDiscount != null)
          TitleAndPrice(
            title: AppHelpers.getTranslation(
                AppLocalizations.of(context)!.discount),
            rightTitle:
                "-${AppHelpers.numberFormat(isOrder: isOrder, symbol: state.orderData?.currencyModel?.symbol, number: isOrder ? (state.orderData?.totalDiscount ?? 0) : (state.calculateData?.totalDiscount ?? 0))}",
            textStyle: AppStyle.interRegular(
              size: 16,
              color: AppStyle.red,
            ),
          ),
        16.verticalSpace,
        if (isOrder
            ? state.orderData?.coupon != null
            : state.calculateData?.couponPrice != null)
          TitleAndPrice(
            title: AppHelpers.getTranslation(
                AppLocalizations.of(context)!.promo_code),
            rightTitle:
                "-${AppHelpers.numberFormat(isOrder: isOrder, symbol: state.orderData?.currencyModel?.symbol, number: isOrder ? (state.orderData?.coupon ?? 0) : state.calculateData?.couponPrice)}",
            textStyle: AppStyle.interRegular(
              size: 16,
              color: AppStyle.red,
            ),
          ),
        16.verticalSpace,
        const Divider(
          color: AppStyle.textGrey,
        ),
        16.verticalSpace,
        TitleAndPrice(
          //modificamos precio total (state.calculateData?.totalPrice ?? 0)
          title: AppHelpers.getTranslation(AppLocalizations.of(context)!.total),
          rightTitle: AppHelpers.numberFormat(
            isOrder: isOrder,
            symbol: state.orderData?.currencyModel?.symbol,
            number: isOrder
                ? (state.orderData?.totalPrice?.isNegative ?? true)
                    ? 0
                    : state.orderData?.totalPrice
                : (state.calculateData?.totalPrice ?? 0),
          ),
          textStyle: AppStyle.interSemi(
            size: 20,
            color: AppStyle.black,
          ),
        ),
      ],
    );
  }
}
