import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/tr_keys.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import '../../../theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class NoConnectionPage extends ConsumerWidget {
  const NoConnectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppStyle.white,
      body: Column(
        children: [
          const SizedBox(height: 200, width: double.infinity),
          const Icon(
            FlutterRemix.wifi_off_fill,
            size: 120,
            color: AppStyle.black,
          ),
          const SizedBox(height: 20),
          Text(
            AppHelpers.getTranslation(
                AppLocalizations.of(context)!.no_internet_connection),
            style: AppStyle.interNoSemi(
              size: 18,
              color: AppStyle.black,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => context.replaceRoute(const SplashRoute()),
            child: const Icon(
              FlutterRemix.restart_fill,
              color: AppStyle.black,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
