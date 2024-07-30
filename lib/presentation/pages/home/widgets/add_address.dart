import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puntossmart/application/home/home_provider.dart';
import 'package:puntossmart/infrastructure/models/data/address_old_data.dart';
import 'package:puntossmart/infrastructure/models/data/location.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppHelpers.getTranslation(AppLocalizations.of(context)!.agree_location),
          style: AppStyle.interSemi(size: 16.sp),
          textAlign: TextAlign.center,
        ),
        24.verticalSpace,
        Row(
          children: [
            Expanded(
              child: CustomButton(
                  title: AppHelpers.getTranslation(AppLocalizations.of(context)!.cancel),
                  borderColor: AppStyle.black,
                  background: AppStyle.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                    context.pushRoute(ViewMapRoute(isPop: true));
                  }),
            ),
            24.horizontalSpace,
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                return CustomButton(
                    title: AppHelpers.getTranslation(AppLocalizations.of(context)!.yes),
                    onPressed: () {
                      Navigator.pop(context);
                      LocalStorage.setAddressSelected(
                        AddressData(
                            title: AppHelpers.getAppAddressName(),
                            location: LocationModel(
                                longitude: (AppHelpers.getInitialLongitude() ??
                                    AppConstants.demoLongitude),
                                latitude: (AppHelpers.getInitialLatitude() ??
                                    AppConstants.demoLatitude))),
                      );
                      ref.read(homeProvider.notifier).setAddress();
                    });
              }),
            ),
          ],
        )
      ],
    );
  }
}
