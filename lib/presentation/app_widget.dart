import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:puntossmart/application/app_widget/app_provider.dart';
import 'package:puntossmart/application/language/language_provider.dart';
import 'package:puntossmart/domain/di/dependency_manager.dart';
import 'package:puntossmart/generated/l10n.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';

import 'components/custom_range_slider.dart';
import 'routes/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:puntossmart/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:ui' as ui;

class AppWidget extends ConsumerWidget {
  AppWidget({super.key});

  final appRouter = AppRouter();
  String _localeCode = 'es'; // Valor por defecto

  Future fetchSetting() async {
    final connect = await Connectivity().checkConnectivity();
    if (connect == ConnectivityResult.wifi ||
        connect == ConnectivityResult.mobile) {
      settingsRepository.getGlobalSettings();
      await settingsRepository.getLanguages();
      await settingsRepository.getMobileTranslations();
    }
    //return await getLanguagePreference();
  }

  Future<String> getLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('selected_language') ?? 'es'; // 'en' es el valor predeterminado si no hay ningún idioma guardado
  }

 

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final languagePreference1 = ref.watch(languagePreferenceProvider); //knjt
  //   final state = ref.refresh(appProvider);
  //   return FutureBuilder(
  //       future: Future.wait([
  //         FlutterDisplayMode.setHighRefreshRate(),
  //         if (LocalStorage.getTranslations().isEmpty) fetchSetting(),      
  //       ]),
  //       builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
  //         return languagePreference1.when(
  //     data: (localeCode) {
  //       final locale = Locale(localeCode);

  //       return ScreenUtilInit(
  //         useInheritedMediaQuery: false,
  //         designSize: const Size(375, 812),
  //         builder: (context, child) {
  //           return RefreshConfiguration(
  //             footerBuilder: () => const ClassicFooter(
  //               idleIcon: SizedBox(),
  //               idleText: "",
  //             ),
  //             headerBuilder: () => const WaterDropMaterialHeader(
  //               backgroundColor: AppStyle.white,
  //               color: AppStyle.textGrey,
  //             ),
  //             child: MaterialApp.router(
  //               debugShowCheckedModeBanner: false,
  //               routerDelegate: appRouter.delegate(),
  //               routeInformationParser: appRouter.defaultRouteParser(),
  //               supportedLocales: L10n.all,
  //               locale: locale,
  //               localizationsDelegates: const [
  //                 AppLocalizations.delegate,
  //                 GlobalMaterialLocalizations.delegate,
  //                 GlobalWidgetsLocalizations.delegate,
  //                 GlobalCupertinoLocalizations.delegate,
  //               ],
  //               theme: ThemeData(
  //                 useMaterial3: false,
  //                 sliderTheme: SliderThemeData(
  //                   overlayShape: SliderComponentShape.noOverlay,
  //                   rangeThumbShape: CustomRoundRangeSliderThumbShape(
  //                     enabledThumbRadius: 12.r,
  //                   ),
  //                 ),
  //               ),
  //               themeMode: ref.watch(appProvider).isDarkMode ? ThemeMode.dark : ThemeMode.light,
  //             ),
  //           );
  //         },
  //       );
  //     },
  //     loading: () => Center(child: CircularProgressIndicator()),
  //     error: (error, stack) => Center(child: Text('Error loading settings')),
  //   );
  //       });
  // }

  

//star
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languagePreference1 = ref.watch(languagePreferenceProvider); //knjt
    final state = ref.refresh(appProvider);
    return FutureBuilder(
        future: Future.wait([
          FlutterDisplayMode.setHighRefreshRate(),
          if (LocalStorage.getTranslations().isEmpty) fetchSetting(),      
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ScreenUtilInit(
            useInheritedMediaQuery: false,
            designSize: const Size(375, 812),
            builder: (context, child) {
              return RefreshConfiguration(
                footerBuilder: () => const ClassicFooter(
                  idleIcon: SizedBox(),
                  idleText: "",
                ),
                headerBuilder: () => const WaterDropMaterialHeader(
                  backgroundColor: AppStyle.white,
                  color: AppStyle.textGrey,
                ),
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerDelegate: appRouter.delegate(),
                  routeInformationParser: appRouter.defaultRouteParser(),
                  //idioma 25-07-24 knjt
                  supportedLocales: L10n.all,
                  locale: Locale(_localeCode),//const Locale('es'),
                  localizationsDelegates: const[
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,

                  ],
                  //locale: Locale(state.activeLanguage?.locale ?? 'es'), //este ya estaba 
                  theme: ThemeData(
                    useMaterial3: false,
                    sliderTheme: SliderThemeData(
                      overlayShape: SliderComponentShape.noOverlay,
                      rangeThumbShape: CustomRoundRangeSliderThumbShape(
                        enabledThumbRadius: 12.r,
                      ),
                    ),
                  ),
                  themeMode:
                      state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                ),
              );
            },
          );
        });
  }
//end
}

