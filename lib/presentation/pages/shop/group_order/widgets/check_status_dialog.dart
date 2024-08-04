import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckStatusDialog extends StatelessWidget {
  final VoidCallback cancel;
  final VoidCallback onTap;

  const CheckStatusDialog({
    super.key,
    required this.cancel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.sizeOf(context).width - 60.w),
      decoration: BoxDecoration(
        color: AppStyle.white.withOpacity(0.96),
        boxShadow: [
          BoxShadow(
            color: AppStyle.white.withOpacity(0.65),
            spreadRadius: 0,
            blurRadius: 60,
            offset: const Offset(0, 20), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          15.verticalSpace,
          Text(
            AppHelpers.getTranslation(
                AppLocalizations.of(context)!.group_order_progress),
            style: AppStyle.interNormal(
              size: 14,
              color: AppStyle.black,
            ),
            textAlign: TextAlign.center,
          ),
          36.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  title: AppHelpers.getTranslation(
                      AppLocalizations.of(context)!.cancel),
                  onPressed: cancel,
                  background: AppStyle.transparent,
                  textColor: AppStyle.black,
                  borderColor: AppStyle.borderColor,
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: CustomButton(
                  title: AppHelpers.getTranslation(
                      AppLocalizations.of(context)!.continue_),
                  onPressed: onTap,
                  background: AppStyle.red,
                  textColor: AppStyle.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
