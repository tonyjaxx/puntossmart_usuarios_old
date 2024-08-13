import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/buttons/animation_button_effect.dart';
import 'package:puntossmart/presentation/pages/profile/qr_code_screen.dart';
import 'package:puntossmart/presentation/pages/profile/scan_qr_code_screen.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SendPointHome extends StatelessWidget {
  const SendPointHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppHelpers.getTranslation(
              AppLocalizations.of(context)!.send_recive_point),
          style: AppStyle.interSemi(size: 20),
        ),
        6.verticalSpace,
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: Text(
            AppHelpers.getTranslation(AppLocalizations.of(context)!.with_qr),
            style: AppStyle.interNormal(size: 14, color: AppStyle.textGrey),
            textAlign: TextAlign.center,
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {
              if (LocalStorage.getToken().isEmpty) {
                context.pushRoute(const LoginRoute());
                return;
              }
              //context.pushRoute(const OrdersListRoute());
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const QRCodeScreen()));
              return;
            },
            child: AnimationButtonEffect(
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    padding: REdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/bg_puntos.png'), // Ruta de tu imagen
                          fit: BoxFit
                              .cover, // Ajusta la imagen para cubrir todo el contenedor
                        ),
                        //color: AppStyle.brandGreen,
                        borderRadius: BorderRadius.circular(16.r)),
                  ),
                  Positioned(
                      right: 10.r,
                      bottom: 20.r,
                      child: Image.asset(
                        "assets/images/scanqr.png",
                        height: 150.r,
                        width: 150.r,
                      )),
                  Positioned(
                      left: 16.r,
                      top: 16.r,
                      right: 110.r,
                      bottom: 16.r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppHelpers.getTranslation(
                                AppLocalizations.of(context)!.scaner_qr),
                            style: AppStyle.interNoSemi(
                                color: AppStyle.white, size: 24),
                          ),
                          const Spacer(),
                          Container(
                            width: 170.r,
                            height: 36.r,
                            padding: REdgeInsets.all(3),
                            decoration: ShapeDecoration(
                              color: AppStyle.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 32.r,
                                  height: double.infinity,
                                  decoration: const BoxDecoration(
                                    //color: AppStyle.brandGreen,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/click.png',
                                    width: 20.r,
                                    height: 20.r,
                                    fit: BoxFit
                                        .contain, // Ajusta la imagen para que se contenga dentro de las dimensiones especificadas
                                  ),
                                  /*Icon(
                                    FlutterRemix.twenty_four_hours_fill,
                                    color: AppStyle.white,
                                    size: 20.r,
                                  ),*/
                                ),
                                6.horizontalSpace,
                                Expanded(
                                  child: Text(
                                    AppHelpers.getTranslation(
                                        AppLocalizations.of(context)!.send_now),
                                    style: AppStyle.interNoSemi(
                                        color: AppStyle.brandGreen, size: 14),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}
