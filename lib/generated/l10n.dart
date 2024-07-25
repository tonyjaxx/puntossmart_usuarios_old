// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `PUNTOS SMART`
  String get puntos_smart {
    return Intl.message(
      'PUNTOS SMART',
      name: 'puntos_smart',
      desc: '',
      args: [],
    );
  }

  /// `Saltar`
  String get skip {
    return Intl.message(
      'Saltar',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Bienvenido a`
  String get auth_login_welcome {
    return Intl.message(
      'Bienvenido a',
      name: 'auth_login_welcome',
      desc: '',
      args: [],
    );
  }

  /// `La red de puntos y descuentos \nmás grande del Perú`
  String get auth_login_description {
    return Intl.message(
      'La red de puntos y descuentos \nmás grande del Perú',
      name: 'auth_login_description',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar Sesión`
  String get auth_login_1 {
    return Intl.message(
      'Iniciar Sesión',
      name: 'auth_login_1',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar`
  String get auth_login_2 {
    return Intl.message(
      'Ingresar',
      name: 'auth_login_2',
      desc: '',
      args: [],
    );
  }

  /// `Acceso`
  String get auth_login_3 {
    return Intl.message(
      'Acceso',
      name: 'auth_login_3',
      desc: '',
      args: [],
    );
  }

  /// `Acceder con`
  String get auth_login_4 {
    return Intl.message(
      'Acceder con',
      name: 'auth_login_4',
      desc: '',
      args: [],
    );
  }

  /// `Regístrese con su correo electrónico o número`
  String get auth_login_register {
    return Intl.message(
      'Regístrese con su correo electrónico o número',
      name: 'auth_login_register',
      desc: '',
      args: [],
    );
  }

  /// `¿Ya tienes una cuenta?`
  String get auth_login_create {
    return Intl.message(
      '¿Ya tienes una cuenta?',
      name: 'auth_login_create',
      desc: '',
      args: [],
    );
  }

  /// `¿Olvidaste tu contraseña?`
  String get auth_login_forget {
    return Intl.message(
      '¿Olvidaste tu contraseña?',
      name: 'auth_login_forget',
      desc: '',
      args: [],
    );
  }

  /// `¿Ya tienes cuenta?`
  String get auth_login_login {
    return Intl.message(
      '¿Ya tienes cuenta?',
      name: 'auth_login_login',
      desc: '',
      args: [],
    );
  }

  /// `Recordar`
  String get auth_login_keep {
    return Intl.message(
      'Recordar',
      name: 'auth_login_keep',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico o celular`
  String get email_or_phone_number {
    return Intl.message(
      'Correo electrónico o celular',
      name: 'email_or_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico o celular invalido`
  String get email_invalid {
    return Intl.message(
      'Correo electrónico o celular invalido',
      name: 'email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `La contraseña debe tener 8 caracteres`
  String get password_invalid {
    return Intl.message(
      'La contraseña debe tener 8 caracteres',
      name: 'password_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Crear Cuenta`
  String get auth_register {
    return Intl.message(
      'Crear Cuenta',
      name: 'auth_register',
      desc: '',
      args: [],
    );
  }

  /// `Servicios`
  String get all_services {
    return Intl.message(
      'Servicios',
      name: 'all_services',
      desc: '',
      args: [],
    );
  }

  /// `hola`
  String get prueba_t {
    return Intl.message(
      'hola',
      name: 'prueba_t',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
