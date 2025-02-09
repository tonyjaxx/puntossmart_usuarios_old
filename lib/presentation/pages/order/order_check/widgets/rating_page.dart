import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:puntossmart/application/order/order_provider.dart';
import 'package:puntossmart/application/parcel/parcel_provider.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/components/text_fields/outline_bordered_text_field.dart';
import 'package:puntossmart/presentation/components/title_icon.dart';
import 'package:puntossmart/presentation/theme/theme.dart';

class RatingPage extends StatefulWidget {
  final bool parcel;

  const RatingPage({super.key, this.parcel = false});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  TextEditingController textEditingController = TextEditingController();
  double rating = 0;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MediaQuery.of(context).viewInsets,
      decoration: BoxDecoration(
          color: AppStyle.bgGrey.withOpacity(0.96),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          )),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.verticalSpace,
              Center(
                child: Container(
                  height: 4.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                      color: AppStyle.dragElement,
                      borderRadius: BorderRadius.all(Radius.circular(40.r))),
                ),
              ),
              24.verticalSpace,
              TitleAndIcon(
                title: AppHelpers.getTranslation(TrKeys.ratingCourier),
                paddingHorizontalSize: 0,
                titleSize: 18,
              ),
              24.verticalSpace,
              OutlinedBorderTextField(
                textController: textEditingController,
                label: AppHelpers.getTranslation(TrKeys.comment).toUpperCase(),
              ),
              24.verticalSpace,
              RatingBar.builder(
                itemBuilder: (context, index) => const Icon(
                  FlutterRemix.star_smile_fill,
                  color: AppStyle.brandGreen,
                ),
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 14.h),
                direction: Axis.horizontal,
                onRatingUpdate: (double value) {
                  rating = value;
                },
                glow: false,
              ),
              40.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 36.h),
                child: Consumer(builder: (context, ref, child) {
                  return CustomButton(
                    isLoading: widget.parcel
                        ? ref.watch(parcelProvider).isButtonLoading
                        : ref.watch(orderProvider).isButtonLoading,
                    background: AppStyle.brandGreen,
                    textColor: AppStyle.black,
                    title: AppHelpers.getTranslation(TrKeys.save),
                    onPressed: () {
                      if (widget.parcel) {
                        ref.read(parcelProvider.notifier).addReview(
                            context, textEditingController.text, rating);
                      } else {
                        ref.read(orderProvider.notifier).addReview(
                            context, textEditingController.text, rating);
                      }

                      // context.replaceRoute(const OrdersListRoute());
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
