import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/components/app_bars/common_app_bar.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../infrastructure/services/local_storage.dart';
import '../../components/buttons/pop_button.dart';

@RoutePage()
class ShareReferralFaqPage extends StatefulWidget {
  final String terms;
  const ShareReferralFaqPage({super.key, required this.terms});

  @override
  State<ShareReferralFaqPage> createState() => _ShareReferralFaqPageState();
}

class _ShareReferralFaqPageState extends State<ShareReferralFaqPage> {
  final bool isLtr = LocalStorage.getLangLtr();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppStyle.bgGrey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CommonAppBar(
                child: Text(
                  AppHelpers.getTranslation(
                      AppLocalizations.of(context)!.referral_faq),
                  style: AppStyle.interNoSemi(
                    size: 18,
                    color: AppStyle.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Text(
                  widget.terms,
                  style: AppStyle.interNoSemi(
                    size: 16,
                    color: AppStyle.black,
                  ),
                ),
              )
            ],
          ),
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
