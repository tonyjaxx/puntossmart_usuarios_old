import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puntossmart/domain/di/dependency_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'language_notifier.dart';
import 'language_state.dart';



final languageProvider = StateNotifierProvider<LanguageNotifier, LanguageState>(
  (ref) => LanguageNotifier(settingsRepository),
);

//knjt 25-07-24
final languagePreferenceProvider = FutureProvider<String>((ref) async {
  final connect = await Connectivity().checkConnectivity();
  if (connect == ConnectivityResult.wifi || connect == ConnectivityResult.mobile) {
    settingsRepository.getGlobalSettings();
    await settingsRepository.getLanguages();
    await settingsRepository.getMobileTranslations();
  }
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('selected_language') ?? 'es'; // 'es' es el valor predeterminado
});


