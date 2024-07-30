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

  /// `Acceso Rápido`
  String get auth_login_3 {
    return Intl.message(
      'Acceso Rápido',
      name: 'auth_login_3',
      desc: '',
      args: [],
    );
  }

  /// `O El Acceso Rápido`
  String get auth_login_4 {
    return Intl.message(
      'O El Acceso Rápido',
      name: 'auth_login_4',
      desc: '',
      args: [],
    );
  }

  /// `Registrate con tu Numero ó Correo Electrónico`
  String get auth_login_register {
    return Intl.message(
      'Registrate con tu Numero ó Correo Electrónico',
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

  /// `Recuerdame`
  String get auth_login_keep {
    return Intl.message(
      'Recuerdame',
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

  /// `Número o Correo Electrónico No Es Válido`
  String get email_invalid {
    return Intl.message(
      'Número o Correo Electrónico No Es Válido',
      name: 'email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `La contraseña debe tener al menos 8 caracteres`
  String get password_invalid {
    return Intl.message(
      'La contraseña debe tener al menos 8 caracteres',
      name: 'password_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Registrate`
  String get auth_register {
    return Intl.message(
      'Registrate',
      name: 'auth_register',
      desc: '',
      args: [],
    );
  }

  /// `Número de celular`
  String get phone_number {
    return Intl.message(
      'Número de celular',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Nombres`
  String get firstname {
    return Intl.message(
      'Nombres',
      name: 'firstname',
      desc: '',
      args: [],
    );
  }

  /// `Apellidos`
  String get surname {
    return Intl.message(
      'Apellidos',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar Contraseña`
  String get confirm_password {
    return Intl.message(
      'Confirmar Contraseña',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `La contraseña debe contener un mínimo de 8 caracteres`
  String get password_minimum_8_characters {
    return Intl.message(
      'La contraseña debe contener un mínimo de 8 caracteres',
      name: 'password_minimum_8_characters',
      desc: '',
      args: [],
    );
  }

  /// `La contraseña no es la misma`
  String get password_is_not_the_same {
    return Intl.message(
      'La contraseña no es la misma',
      name: 'password_is_not_the_same',
      desc: '',
      args: [],
    );
  }

  /// `Código de referido (Opcional)`
  String get referral {
    return Intl.message(
      'Código de referido (Opcional)',
      name: 'referral',
      desc: '',
      args: [],
    );
  }

  /// `Agregar ubicación`
  String get agree_location {
    return Intl.message(
      'Agregar ubicación',
      name: 'agree_location',
      desc: '',
      args: [],
    );
  }

  /// `Si`
  String get yes {
    return Intl.message(
      'Si',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar`
  String get cancel {
    return Intl.message(
      'Cancelar',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Aplicar`
  String get apply {
    return Intl.message(
      'Aplicar',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa código OTP`
  String get enter_otp {
    return Intl.message(
      'Ingresa código OTP',
      name: 'enter_otp',
      desc: '',
      args: [],
    );
  }

  /// `Código OTP enviado a`
  String get send_otp {
    return Intl.message(
      'Código OTP enviado a',
      name: 'send_otp',
      desc: '',
      args: [],
    );
  }

  /// `Reenviar`
  String get resend_otp {
    return Intl.message(
      'Reenviar',
      name: 'resend_otp',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar`
  String get confirm {
    return Intl.message(
      'Confirmar',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Ingrese el código de verificación`
  String get hint_opt {
    return Intl.message(
      'Ingrese el código de verificación',
      name: 'hint_opt',
      desc: '',
      args: [],
    );
  }

  /// `El carrito esta vacío`
  String get cart_is_empty {
    return Intl.message(
      'El carrito esta vacío',
      name: 'cart_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Proximamente`
  String get coming_soon {
    return Intl.message(
      'Proximamente',
      name: 'coming_soon',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key

  /// `Todos los Servicios`
  String get all_services {
    return Intl.message(
      'Todos los Servicios',
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

  /// `Seleccionar Idioma`
  String get select_language {
    return Intl.message(
      'Seleccionar Idioma',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Español`
  String get spanish {
    return Intl.message(
      'Español',
      name: 'spanish',
      desc: '',
      args: [],
    );
  }

  /// `Ingles`
  String get english {
    return Intl.message(
      'Ingles',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Guardar`
  String get btn_save {
    return Intl.message(
      'Guardar',
      name: 'btn_save',
      desc: '',
      args: [],
    );
  }

  /// `Configuración de la cuenta`
  String get profile_settings {
    return Intl.message(
      'Configuración de la cuenta',
      name: 'profile_settings',
      desc: '',
      args: [],
    );
  }

  /// `Mi código QR`
  String get qr_code {
    return Intl.message(
      'Mi código QR',
      name: 'qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Enviar y Recibir Puntos Smart`
  String get friends {
    return Intl.message(
      'Enviar y Recibir Puntos Smart',
      name: 'friends',
      desc: '',
      args: [],
    );
  }

  /// `Billetera Smart`
  String get wallet {
    return Intl.message(
      'Billetera Smart',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Invitar amigos`
  String get shared_friends {
    return Intl.message(
      'Invitar amigos',
      name: 'shared_friends',
      desc: '',
      args: [],
    );
  }

  /// `Historial de promociones`
  String get orders {
    return Intl.message(
      'Historial de promociones',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Entregas`
  String get parcels {
    return Intl.message(
      'Entregas',
      name: 'parcels',
      desc: '',
      args: [],
    );
  }

  /// `Notificationes`
  String get notifications {
    return Intl.message(
      'Notificationes',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Comprar puntos`
  String get buy_points {
    return Intl.message(
      'Comprar puntos',
      name: 'buy_points',
      desc: '',
      args: [],
    );
  }

  /// `Dirección de entrega`
  String get delivery_address {
    return Intl.message(
      'Dirección de entrega',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Me gusta`
  String get liked {
    return Intl.message(
      'Me gusta',
      name: 'liked',
      desc: '',
      args: [],
    );
  }

  /// `Convierte en Comercio SMART`
  String get become_seller {
    return Intl.message(
      'Convierte en Comercio SMART',
      name: 'become_seller',
      desc: '',
      args: [],
    );
  }

  /// `Contacta con un ADMIN`
  String get chat_admin {
    return Intl.message(
      'Contacta con un ADMIN',
      name: 'chat_admin',
      desc: '',
      args: [],
    );
  }

  /// `Idioma`
  String get languages {
    return Intl.message(
      'Idioma',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Moneda`
  String get currencies {
    return Intl.message(
      'Moneda',
      name: 'currencies',
      desc: '',
      args: [],
    );
  }

  /// `Notificaciones Smart`
  String get notification {
    return Intl.message(
      'Notificaciones Smart',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Ayuda`
  String get help {
    return Intl.message(
      'Ayuda',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Sobre nosotros`
  String get about {
    return Intl.message(
      'Sobre nosotros',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Careers`
  String get careers {
    return Intl.message(
      'Careers',
      name: 'careers',
      desc: '',
      args: [],
    );
  }

  /// `Blog`
  String get blogs {
    return Intl.message(
      'Blog',
      name: 'blogs',
      desc: '',
      args: [],
    );
  }

  /// `Politicas de Privacidad`
  String get privacy_policy {
    return Intl.message(
      'Politicas de Privacidad',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terminos y Condiciones`
  String get terms {
    return Intl.message(
      'Terminos y Condiciones',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Regístrate para entregar`
  String get sing_up_to_deliver {
    return Intl.message(
      'Regístrate para entregar',
      name: 'sing_up_to_deliver',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar Cuenta`
  String get delete_account {
    return Intl.message(
      'Eliminar Cuenta',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Recomendaciones para ti`
  String get especially_for_you {
    return Intl.message(
      'Recomendaciones para ti',
      name: 'especially_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Tu puerta personal`
  String get your_personal_door {
    return Intl.message(
      'Tu puerta personal',
      name: 'your_personal_door',
      desc: '',
      args: [],
    );
  }

  /// `Puerta a puerta`
  String get door_to_door {
    return Intl.message(
      'Puerta a puerta',
      name: 'door_to_door',
      desc: '',
      args: [],
    );
  }

  /// `Trabajo para ti`
  String get work_for_you {
    return Intl.message(
      'Trabajo para ti',
      name: 'work_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Elije tu marca`
  String get choose_brand {
    return Intl.message(
      'Elije tu marca',
      name: 'choose_brand',
      desc: '',
      args: [],
    );
  }

  /// `Buscar Restaurantes y Productos`
  String get search_restaurnats_products {
    return Intl.message(
      'Buscar Restaurantes y Productos',
      name: 'search_restaurnats_products',
      desc: '',
      args: [],
    );
  }

  /// `Populares para ti`
  String get popular_near_you {
    return Intl.message(
      'Populares para ti',
      name: 'popular_near_you',
      desc: '',
      args: [],
    );
  }

  /// `Noticias de la semana`
  String get new_of_week {
    return Intl.message(
      'Noticias de la semana',
      name: 'new_of_week',
      desc: '',
      args: [],
    );
  }

  /// `Ver más`
  String get see_all {
    return Intl.message(
      'Ver más',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Recomendado`
  String get recommended {
    return Intl.message(
      'Recomendado',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `RESPONDE AHORA`
  String get answer_now {
    return Intl.message(
      'RESPONDE AHORA',
      name: 'answer_now',
      desc: '',
      args: [],
    );
  }

  /// `Encuestas`
  String get surveys {
    return Intl.message(
      'Encuestas',
      name: 'surveys',
      desc: '',
      args: [],
    );
  }

  /// `Promociones`
  String get promotions {
    return Intl.message(
      'Promociones',
      name: 'promotions',
      desc: '',
      args: [],
    );
  }

  /// `Seleccionar dirección`
  String get select_address {
    return Intl.message(
      'Seleccionar dirección',
      name: 'select_address',
      desc: '',
      args: [],
    );
  }

  /// `Agregar dirección`
  String get add_address {
    return Intl.message(
      'Agregar dirección',
      name: 'add_address',
      desc: '',
      args: [],
    );
  }

  /// `Leer más`
  String get learn_more {
    return Intl.message(
      'Leer más',
      name: 'learn_more',
      desc: '',
      args: [],
    );
  }

  /// `Cómo funciona`
  String get how_it_works {
    return Intl.message(
      'Cómo funciona',
      name: 'how_it_works',
      desc: '',
      args: [],
    );
  }

  /// `Entregas`
  String get pickup {
    return Intl.message(
      'Entregas',
      name: 'pickup',
      desc: '',
      args: [],
    );
  }

  /// `Entregar a`
  String get delivery_to {
    return Intl.message(
      'Entregar a',
      name: 'delivery_to',
      desc: '',
      args: [],
    );
  }

  /// `Ahorra tiempo`
  String get save_time {
    return Intl.message(
      'Ahorra tiempo',
      name: 'save_time',
      desc: '',
      args: [],
    );
  }

  /// `Entrega rápida y segura`
  String get fast_secure_delivery {
    return Intl.message(
      'Entrega rápida y segura',
      name: 'fast_secure_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Restricción de entrega`
  String get delivery_restriction {
    return Intl.message(
      'Restricción de entrega',
      name: 'delivery_restriction',
      desc: '',
      args: [],
    );
  }

  /// `Planifica la entrega`
  String get set_up_deliver {
    return Intl.message(
      'Planifica la entrega',
      name: 'set_up_deliver',
      desc: '',
      args: [],
    );
  }

  /// `No se encontraron reultados`
  String get nothing_found {
    return Intl.message(
      'No se encontraron reultados',
      name: 'nothing_found',
      desc: '',
      args: [],
    );
  }

  /// `Hay`
  String get found {
    return Intl.message(
      'Hay',
      name: 'found',
      desc: '',
      args: [],
    );
  }

  /// `Resultados`
  String get results {
    return Intl.message(
      'Resultados',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `Restaurantes`
  String get restaurants {
    return Intl.message(
      'Restaurantes',
      name: 'restaurants',
      desc: '',
      args: [],
    );
  }

  /// `Productos`
  String get products {
    return Intl.message(
      'Productos',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Vistos recientemente`
  String get recently {
    return Intl.message(
      'Vistos recientemente',
      name: 'recently',
      desc: '',
      args: [],
    );
  }

  /// `Limpiar`
  String get clear {
    return Intl.message(
      'Limpiar',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Flitrar`
  String get filter {
    return Intl.message(
      'Flitrar',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Resultados Encontrados`
  String get found_results {
    return Intl.message(
      'Resultados Encontrados',
      name: 'found_results',
      desc: '',
      args: [],
    );
  }

  /// `Intentar de nuevo`
  String get try_searching_again {
    return Intl.message(
      'Intentar de nuevo',
      name: 'try_searching_again',
      desc: '',
      args: [],
    );
  }
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
