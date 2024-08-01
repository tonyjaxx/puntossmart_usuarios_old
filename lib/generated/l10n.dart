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

  /// `Amigos`
  String get friend_ {
    return Intl.message(
      'Amigos',
      name: 'friend_',
      desc: '',
      args: [],
    );
  }

  /// `No se encontro el Usuario`
  String get no_user_found {
    return Intl.message(
      'No se encontro el Usuario',
      name: 'no_user_found',
      desc: '',
      args: [],
    );
  }

  /// `No se encontro el Amigo`
  String get no_friend_found {
    return Intl.message(
      'No se encontro el Amigo',
      name: 'no_friend_found',
      desc: '',
      args: [],
    );
  }

  /// `Agregar Amigo SMART`
  String get add_friend {
    return Intl.message(
      'Agregar Amigo SMART',
      name: 'add_friend',
      desc: '',
      args: [],
    );
  }

  /// `Amigo agregado exitosamente`
  String get friend_added_successfully {
    return Intl.message(
      'Amigo agregado exitosamente',
      name: 'friend_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Regresar al Inicio`
  String get back_to_home {
    return Intl.message(
      'Regresar al Inicio',
      name: 'back_to_home',
      desc: '',
      args: [],
    );
  }

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

  /// `Mi QR Smart`
  String get qr_code {
    return Intl.message(
      'Mi QR Smart',
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

  /// `Mi Billetera Smart`
  String get wallet {
    return Intl.message(
      'Mi Billetera Smart',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Mis Referidos Smart`
  String get shared_friends {
    return Intl.message(
      'Mis Referidos Smart',
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

  /// `Notificationes Smart`
  String get notifications {
    return Intl.message(
      'Notificationes Smart',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Comprar Puntos Smart`
  String get buy_points {
    return Intl.message(
      'Comprar Puntos Smart',
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

  /// `Mis Me Gusta`
  String get liked {
    return Intl.message(
      'Mis Me Gusta',
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

  /// `Carreras Smart`
  String get careers {
    return Intl.message(
      'Carreras Smart',
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

  /// `Recomendaciones Smart`
  String get especially_for_you {
    return Intl.message(
      'Recomendaciones Smart',
      name: 'especially_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Mantén un mejor control con la ayuda SMART`
  String get your_personal_door {
    return Intl.message(
      'Mantén un mejor control con la ayuda SMART',
      name: 'your_personal_door',
      desc: '',
      args: [],
    );
  }

  /// `Verifica tus Cupones`
  String get door_to_door {
    return Intl.message(
      'Verifica tus Cupones',
      name: 'door_to_door',
      desc: '',
      args: [],
    );
  }

  /// `Verificalo aquí`
  String get work_for_you {
    return Intl.message(
      'Verificalo aquí',
      name: 'work_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Encuentra tu Marca Smart`
  String get choose_brand {
    return Intl.message(
      'Encuentra tu Marca Smart',
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

  /// `Lo Mejor de la semana`
  String get new_of_week {
    return Intl.message(
      'Lo Mejor de la semana',
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

  /// `Responde y Gana Ya!`
  String get answer_now {
    return Intl.message(
      'Responde y Gana Ya!',
      name: 'answer_now',
      desc: '',
      args: [],
    );
  }

  /// `Encuestas Smart`
  String get surveys {
    return Intl.message(
      'Encuestas Smart',
      name: 'surveys',
      desc: '',
      args: [],
    );
  }

  /// `Promociones Smart`
  String get promotions {
    return Intl.message(
      'Promociones Smart',
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

  /// `Comercios`
  String get restaurants {
    return Intl.message(
      'Comercios',
      name: 'restaurants',
      desc: '',
      args: [],
    );
  }

  /// `Productos Smart`
  String get products {
    return Intl.message(
      'Productos Smart',
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

  /// `Más información`
  String get more_info {
    return Intl.message(
      'Más información',
      name: 'more_info',
      desc: '',
      args: [],
    );
  }

  /// `Horario`
  String get working_hours {
    return Intl.message(
      'Horario',
      name: 'working_hours',
      desc: '',
      args: [],
    );
  }

  /// `Tiempo de entrega`
  String get delivery_time {
    return Intl.message(
      'Tiempo de entrega',
      name: 'delivery_time',
      desc: '',
      args: [],
    );
  }

  /// `Precio`
  String get delivery_price {
    return Intl.message(
      'Precio',
      name: 'delivery_price',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar Pedido en Grupal`
  String get start_group_oder {
    return Intl.message(
      'Iniciar Pedido en Grupal',
      name: 'start_group_oder',
      desc: '',
      args: [],
    );
  }

  /// `Todo`
  String get all {
    return Intl.message(
      'Todo',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Administrar Promocion Smart`
  String get manage_orden {
    return Intl.message(
      'Administrar Promocion Smart',
      name: 'manage_orden',
      desc: '',
      args: [],
    );
  }

  /// `Administra tu Promocion Smart`
  String get you_fully_manage {
    return Intl.message(
      'Administra tu Promocion Smart',
      name: 'you_fully_manage',
      desc: '',
      args: [],
    );
  }

  /// `Miembro del Pedido`
  String get group_member {
    return Intl.message(
      'Miembro del Pedido',
      name: 'group_member',
      desc: '',
      args: [],
    );
  }

  /// `Eligiendo`
  String get choosing {
    return Intl.message(
      'Eligiendo',
      name: 'choosing',
      desc: '',
      args: [],
    );
  }

  /// `Progreso del Pedido grupal`
  String get group_order_progress {
    return Intl.message(
      'Progreso del Pedido grupal',
      name: 'group_order_progress',
      desc: '',
      args: [],
    );
  }

  /// `Agregar`
  String get add {
    return Intl.message(
      'Agregar',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Desde`
  String get from {
    return Intl.message(
      'Desde',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar`
  String get close {
    return Intl.message(
      'Cerrar',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Hoy Cerrado`
  String get not_work_today_time {
    return Intl.message(
      'Hoy Cerrado',
      name: 'not_work_today_time',
      desc: '',
      args: [],
    );
  }

  /// `Populares`
  String get popular {
    return Intl.message(
      'Populares',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Abandonar Grupo`
  String get leave_group {
    return Intl.message(
      'Abandonar Grupo',
      name: 'leave_group',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get continue_ {
    return Intl.message(
      'Continuar',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `Precio de salida`
  String get start_price {
    return Intl.message(
      'Precio de salida',
      name: 'start_price',
      desc: '',
      args: [],
    );
  }

  /// `Descuento Smart`
  String get discount {
    return Intl.message(
      'Descuento Smart',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Productos con descuento`
  String get discount_products {
    return Intl.message(
      'Productos con descuento',
      name: 'discount_products',
      desc: '',
      args: [],
    );
  }

  /// `Mescecita seleccionar un producto`
  String get need_select_product {
    return Intl.message(
      'Mescecita seleccionar un producto',
      name: 'need_select_product',
      desc: '',
      args: [],
    );
  }

  /// `Terminar`
  String get done {
    return Intl.message(
      'Terminar',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Editar Pedido`
  String get is_edit_order {
    return Intl.message(
      'Editar Pedido',
      name: 'is_edit_order',
      desc: '',
      args: [],
    );
  }

  /// `Su Pedido`
  String get your_order {
    return Intl.message(
      'Su Pedido',
      name: 'your_order',
      desc: '',
      args: [],
    );
  }

  /// `Borrar todo`
  String get clear_all {
    return Intl.message(
      'Borrar todo',
      name: 'clear_all',
      desc: '',
      args: [],
    );
  }

  /// `Todo agregado previamente`
  String get all_previously_added {
    return Intl.message(
      'Todo agregado previamente',
      name: 'all_previously_added',
      desc: '',
      args: [],
    );
  }

  /// `Bajo`
  String get under {
    return Intl.message(
      'Bajo',
      name: 'under',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás seguro?`
  String get are_you_sure {
    return Intl.message(
      '¿Estás seguro?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar Sesión`
  String get logout {
    return Intl.message(
      'Cerrar Sesión',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Restablecer Contraseña`
  String get reset_password {
    return Intl.message(
      'Restablecer Contraseña',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Restablecer texto de contraseña`
  String get reset_password_text {
    return Intl.message(
      'Restablecer texto de contraseña',
      name: 'reset_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Ingrese sus datos`
  String get can_not_be_empty {
    return Intl.message(
      'Ingrese sus datos',
      name: 'can_not_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Enviar`
  String get send {
    return Intl.message(
      'Enviar',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Has enviado con éxito`
  String get you_have_successfully_sent {
    return Intl.message(
      'Has enviado con éxito',
      name: 'you_have_successfully_sent',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás seguro de enviar?`
  String get are_you_sure_to_send {
    return Intl.message(
      '¿Estás seguro de enviar?',
      name: 'are_you_sure_to_send',
      desc: '',
      args: [],
    );
  }

  /// `Enviar puntos`
  String get send_points {
    return Intl.message(
      'Enviar puntos',
      name: 'send_points',
      desc: '',
      args: [],
    );
  }

  /// `No tienes suficientes puntos`
  String get you_dont_have_enough_points {
    return Intl.message(
      'No tienes suficientes puntos',
      name: 'you_dont_have_enough_points',
      desc: '',
      args: [],
    );
  }

  /// `Los puntos deben ser mayores que cero`
  String get points_should_be_greater_then_zero {
    return Intl.message(
      'Los puntos deben ser mayores que cero',
      name: 'points_should_be_greater_then_zero',
      desc: '',
      args: [],
    );
  }

  /// `Rango de Precios`
  String get price_range {
    return Intl.message(
      'Rango de Precios',
      name: 'price_range',
      desc: '',
      args: [],
    );
  }

  /// `Clasificación`
  String get rating {
    return Intl.message(
      'Clasificación',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Ordenar por`
  String get sort_by {
    return Intl.message(
      'Ordenar por',
      name: 'sort_by',
      desc: '',
      args: [],
    );
  }

  /// `Ofrece Delivery`
  String get free_delivery {
    return Intl.message(
      'Ofrece Delivery',
      name: 'free_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Ofertas`
  String get deals {
    return Intl.message(
      'Ofertas',
      name: 'deals',
      desc: '',
      args: [],
    );
  }

  /// `Tienda abierta`
  String get open_shop {
    return Intl.message(
      'Tienda abierta',
      name: 'open_shop',
      desc: '',
      args: [],
    );
  }

  /// `Aleatorio`
  String get trust_you {
    return Intl.message(
      'Aleatorio',
      name: 'trust_you',
      desc: '',
      args: [],
    );
  }

  /// `Mejor venta`
  String get best_sale {
    return Intl.message(
      'Mejor venta',
      name: 'best_sale',
      desc: '',
      args: [],
    );
  }

  /// `Altamente calificado`
  String get highly_rated {
    return Intl.message(
      'Altamente calificado',
      name: 'highly_rated',
      desc: '',
      args: [],
    );
  }

  /// `Baja venta`
  String get low_sale {
    return Intl.message(
      'Baja venta',
      name: 'low_sale',
      desc: '',
      args: [],
    );
  }

  /// `Calificación baja`
  String get low_rating {
    return Intl.message(
      'Calificación baja',
      name: 'low_rating',
      desc: '',
      args: [],
    );
  }

  /// `Mostrar`
  String get show {
    return Intl.message(
      'Mostrar',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Tiendas`
  String get shops {
    return Intl.message(
      'Tiendas',
      name: 'shops',
      desc: '',
      args: [],
    );
  }

  /// `Todas las tiendas`
  String get all_shops {
    return Intl.message(
      'Todas las tiendas',
      name: 'all_shops',
      desc: '',
      args: [],
    );
  }

  /// `Ofertas Especiales`
  String get special_offers {
    return Intl.message(
      'Ofertas Especiales',
      name: 'special_offers',
      desc: '',
      args: [],
    );
  }

  /// `Cargando`
  String get loading {
    return Intl.message(
      'Cargando',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Mis Promociones`
  String get my_promotions {
    return Intl.message(
      'Mis Promociones',
      name: 'my_promotions',
      desc: '',
      args: [],
    );
  }

  /// `Promociones Activas`
  String get active_orders {
    return Intl.message(
      'Promociones Activas',
      name: 'active_orders',
      desc: '',
      args: [],
    );
  }

  /// `Promociones Completas`
  String get order_history {
    return Intl.message(
      'Promociones Completas',
      name: 'order_history',
      desc: '',
      args: [],
    );
  }

  /// `Nuevo`
  String get new_ {
    return Intl.message(
      'Nuevo',
      name: 'new_',
      desc: '',
      args: [],
    );
  }

  /// `Composición de la Promoción`
  String get composition_order {
    return Intl.message(
      'Composición de la Promoción',
      name: 'composition_order',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Cancelar Promoción`
  String get cancel_order {
    return Intl.message(
      'Cancelar Promoción',
      name: 'cancel_order',
      desc: '',
      args: [],
    );
  }

  /// `Quiero Jugar`
  String get want_to_play {
    return Intl.message(
      'Quiero Jugar',
      name: 'want_to_play',
      desc: '',
      args: [],
    );
  }

  /// `Causa`
  String get cause {
    return Intl.message(
      'Causa',
      name: 'cause',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get call_the_driver {
    return Intl.message(
      '',
      name: 'call_the_driver',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get send_message {
    return Intl.message(
      '',
      name: 'send_message',
      desc: '',
      args: [],
    );
  }

  /// `Mi Balance`
  String get my_balance {
    return Intl.message(
      'Mi Balance',
      name: 'my_balance',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad de puntos`
  String get deposit {
    return Intl.message(
      'Cantidad de puntos',
      name: 'deposit',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key

  /// `Imagen de Fondo`
  String get bg_picture {
    return Intl.message(
      'Imagen de Fondo',
      name: 'bg_picture',
      desc: '',
      args: [],
    );
  }

  /// `Tipo de UI`
  String get ui_type {
    return Intl.message(
      'Tipo de UI',
      name: 'ui_type',
      desc: '',
      args: [],
    );
  }

  /// `Leer Todo`
  String get read_all {
    return Intl.message(
      'Leer Todo',
      name: 'read_all',
      desc: '',
      args: [],
    );
  }

  /// `Ofertas`
  String get offers {
    return Intl.message(
      'Ofertas',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Inicio`
  String get home {
    return Intl.message(
      'Inicio',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Mejor`
  String get best {
    return Intl.message(
      'Mejor',
      name: 'best',
      desc: '',
      args: [],
    );
  }

  /// `Juego`
  String get game {
    return Intl.message(
      'Juego',
      name: 'game',
      desc: '',
      args: [],
    );
  }

  /// `¿Quieres Jugar?`
  String get want_to_play_game {
    return Intl.message(
      '¿Quieres Jugar?',
      name: 'want_to_play_game',
      desc: '',
      args: [],
    );
  }

  /// `Tú Ganas`
  String get you_win {
    return Intl.message(
      'Tú Ganas',
      name: 'you_win',
      desc: '',
      args: [],
    );
  }

  /// `Nuevo Juego`
  String get new_game {
    return Intl.message(
      'Nuevo Juego',
      name: 'new_game',
      desc: '',
      args: [],
    );
  }

  /// `Juego Terminado`
  String get game_over {
    return Intl.message(
      'Juego Terminado',
      name: 'game_over',
      desc: '',
      args: [],
    );
  }

  /// `Puntuación`
  String get score {
    return Intl.message(
      'Puntuación',
      name: 'score',
      desc: '',
      args: [],
    );
  }

  /// `Intentar de Nuevo`
  String get try_again {
    return Intl.message(
      'Intentar de Nuevo',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `Este Campo es Requerido`
  String get this_field_is_required {
    return Intl.message(
      'Este Campo es Requerido',
      name: 'this_field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Si Quieres Usar Este Servicio`
  String get if_you_want_to_use_this_service {
    return Intl.message(
      'Si Quieres Usar Este Servicio',
      name: 'if_you_want_to_use_this_service',
      desc: '',
      args: [],
    );
  }

  /// `Receptor`
  String get receiver {
    return Intl.message(
      'Receptor',
      name: 'receiver',
      desc: '',
      args: [],
    );
  }

  /// `Seleccionar Método de Pago`
  String get select_payment_method {
    return Intl.message(
      'Seleccionar Método de Pago',
      name: 'select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Debes Escribir el Teléfono y el Nombre para Alguien`
  String get you_write_phone_and_firstname_for_someone {
    return Intl.message(
      'Debes Escribir el Teléfono y el Nombre para Alguien',
      name: 'you_write_phone_and_firstname_for_someone',
      desc: '',
      args: [],
    );
  }

  /// `SM`
  String get sm {
    return Intl.message(
      'SM',
      name: 'sm',
      desc: '',
      args: [],
    );
  }

  /// `Tu Pedido No Alcanzó el Monto Mínimo. El Monto Mínimo es`
  String get your_order_did_not_reach_min_amount_min_amount_is {
    return Intl.message(
      'Tu Pedido No Alcanzó el Monto Mínimo. El Monto Mínimo es',
      name: 'your_order_did_not_reach_min_amount_min_amount_is',
      desc: '',
      args: [],
    );
  }

  /// `No Pagado`
  String get unpaid {
    return Intl.message(
      'No Pagado',
      name: 'unpaid',
      desc: '',
      args: [],
    );
  }

  /// `Pagar Después`
  String get pay_later {
    return Intl.message(
      'Pagar Después',
      name: 'pay_later',
      desc: '',
      args: [],
    );
  }

  /// `Pagar`
  String get pay {
    return Intl.message(
      'Pagar',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Quiero Pedir para Alguien`
  String get i_want_to_order_for_someone {
    return Intl.message(
      'Quiero Pedir para Alguien',
      name: 'i_want_to_order_for_someone',
      desc: '',
      args: [],
    );
  }

  /// `Caro`
  String get expensive {
    return Intl.message(
      'Caro',
      name: 'expensive',
      desc: '',
      args: [],
    );
  }

  /// `Menos Caro`
  String get least_expensive {
    return Intl.message(
      'Menos Caro',
      name: 'least_expensive',
      desc: '',
      args: [],
    );
  }

  /// `Estándar`
  String get standard {
    return Intl.message(
      'Estándar',
      name: 'standard',
      desc: '',
      args: [],
    );
  }

  /// `Entendido`
  String get got_it {
    return Intl.message(
      'Entendido',
      name: 'got_it',
      desc: '',
      args: [],
    );
  }

  /// `Tipo`
  String get type {
    return Intl.message(
      'Tipo',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Detalles del Paquete`
  String get parcel_details {
    return Intl.message(
      'Detalles del Paquete',
      name: 'parcel_details',
      desc: '',
      args: [],
    );
  }

  /// `Paquete Activo`
  String get active_parcel {
    return Intl.message(
      'Paquete Activo',
      name: 'active_parcel',
      desc: '',
      args: [],
    );
  }

  /// `Historial de Paquetes`
  String get parcel_history {
    return Intl.message(
      'Historial de Paquetes',
      name: 'parcel_history',
      desc: '',
      args: [],
    );
  }

  /// `Valor del Artículo`
  String get item_value {
    return Intl.message(
      'Valor del Artículo',
      name: 'item_value',
      desc: '',
      args: [],
    );
  }

  /// `Permanecer Anónimo`
  String get remain_anonymous {
    return Intl.message(
      'Permanecer Anónimo',
      name: 'remain_anonymous',
      desc: '',
      args: [],
    );
  }

  /// `No Notificar al Receptor`
  String get dont_notify_recipient {
    return Intl.message(
      'No Notificar al Receptor',
      name: 'dont_notify_recipient',
      desc: '',
      args: [],
    );
  }

  /// `Destinatario`
  String get recipient {
    return Intl.message(
      'Destinatario',
      name: 'recipient',
      desc: '',
      args: [],
    );
  }

  /// `Remitente`
  String get sender {
    return Intl.message(
      'Remitente',
      name: 'sender',
      desc: '',
      args: [],
    );
  }

  /// `Explorar`
  String get explore {
    return Intl.message(
      'Explorar',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Agregar Instrucción`
  String get add_instruction {
    return Intl.message(
      'Agregar Instrucción',
      name: 'add_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Nuevos Artículos con Descuento`
  String get new_item {
    return Intl.message(
      'Nuevos Artículos con Descuento',
      name: 'new_item',
      desc: '',
      args: [],
    );
  }

  /// `¿Qué Estás Enviando?`
  String get what_are_you_sending {
    return Intl.message(
      '¿Qué Estás Enviando?',
      name: 'what_are_you_sending',
      desc: '',
      args: [],
    );
  }

  /// `Descripción del Artículo`
  String get item_description {
    return Intl.message(
      'Descripción del Artículo',
      name: 'item_description',
      desc: '',
      args: [],
    );
  }

  /// `Generar Imagen`
  String get image_generate_take {
    return Intl.message(
      'Generar Imagen',
      name: 'image_generate_take',
      desc: '',
      args: [],
    );
  }

  /// `Generar Imagen con ChatGPT`
  String get generate_image_with_chatgpt {
    return Intl.message(
      'Generar Imagen con ChatGPT',
      name: 'generate_image_with_chatgpt',
      desc: '',
      args: [],
    );
  }

  /// `Galería`
  String get gallery {
    return Intl.message(
      'Galería',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Configurar Entrega`
  String get set_up_delivery {
    return Intl.message(
      'Configurar Entrega',
      name: 'set_up_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Atrás`
  String get back {
    return Intl.message(
      'Atrás',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `KG`
  String get kg {
    return Intl.message(
      'KG',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Hasta`
  String get up_to {
    return Intl.message(
      'Hasta',
      name: 'up_to',
      desc: '',
      args: [],
    );
  }

  /// `Error al Conectar con Firebase`
  String get error_with_connecting_to_firebase {
    return Intl.message(
      'Error al Conectar con Firebase',
      name: 'error_with_connecting_to_firebase',
      desc: '',
      args: [],
    );
  }

  /// `¿Dejas el Grupo?`
  String get do_you_leave_group {
    return Intl.message(
      '¿Dejas el Grupo?',
      name: 'do_you_leave_group',
      desc: '',
      args: [],
    );
  }

  /// `Chatear con el Administrador`
  String get chat_with_admin {
    return Intl.message(
      'Chatear con el Administrador',
      name: 'chat_with_admin',
      desc: '',
      args: [],
    );
  }

  /// `Seleccionar`
  String get select {
    return Intl.message(
      'Seleccionar',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Carrito`
  String get cart {
    return Intl.message(
      'Carrito',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Historias`
  String get stories {
    return Intl.message(
      'Historias',
      name: 'stories',
      desc: '',
      args: [],
    );
  }

  /// `Marcas Favoritas`
  String get favourite_brands {
    return Intl.message(
      'Marcas Favoritas',
      name: 'favourite_brands',
      desc: '',
      args: [],
    );
  }

  /// `FoSend`
  String get fosend {
    return Intl.message(
      'FoSend',
      name: 'fosend',
      desc: '',
      args: [],
    );
  }

  /// `Gracias por tu Pedido`
  String get thank_you_for_order {
    return Intl.message(
      'Gracias por tu Pedido',
      name: 'thank_you_for_order',
      desc: '',
      args: [],
    );
  }

  /// `Escribe Algo`
  String get type_something {
    return Intl.message(
      'Escribe Algo',
      name: 'type_something',
      desc: '',
      args: [],
    );
  }

  /// `Pedido en Grupo`
  String get group_order {
    return Intl.message(
      'Pedido en Grupo',
      name: 'group_order',
      desc: '',
      args: [],
    );
  }

  /// `Unirse al Pedido`
  String get join_order {
    return Intl.message(
      'Unirse al Pedido',
      name: 'join_order',
      desc: '',
      args: [],
    );
  }

  /// `Unirse`
  String get join {
    return Intl.message(
      'Unirse',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Solo Puedes`
  String get you_can_only {
    return Intl.message(
      'Solo Puedes',
      name: 'you_can_only',
      desc: '',
      args: [],
    );
  }

  /// `Sucursales`
  String get branches {
    return Intl.message(
      'Sucursales',
      name: 'branches',
      desc: '',
      args: [],
    );
  }

  /// `No Funciona`
  String get not_work {
    return Intl.message(
      'No Funciona',
      name: 'not_work',
      desc: '',
      args: [],
    );
  }

  /// `Horario`
  String get time_schedule {
    return Intl.message(
      'Horario',
      name: 'time_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Copiado`
  String get copied {
    return Intl.message(
      'Copiado',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Preguntas Frecuentes sobre Referidos`
  String get referral_faq {
    return Intl.message(
      'Preguntas Frecuentes sobre Referidos',
      name: 'referral_faq',
      desc: '',
      args: [],
    );
  }

  /// `Calificaciones`
  String get ratings {
    return Intl.message(
      'Calificaciones',
      name: 'ratings',
      desc: '',
      args: [],
    );
  }

  /// `El Estado de tu Pedido ha Cambiado`
  String get your_order_status_has_been_changed {
    return Intl.message(
      'El Estado de tu Pedido ha Cambiado',
      name: 'your_order_status_has_been_changed',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad Máxima`
  String get max_qty {
    return Intl.message(
      'Cantidad Máxima',
      name: 'max_qty',
      desc: '',
      args: [],
    );
  }

  /// `Abierto Hasta`
  String get open_until {
    return Intl.message(
      'Abierto Hasta',
      name: 'open_until',
      desc: '',
      args: [],
    );
  }

  /// `No Suficiente Dinero`
  String get not_enough_money {
    return Intl.message(
      'No Suficiente Dinero',
      name: 'not_enough_money',
      desc: '',
      args: [],
    );
  }

  /// `Regístrate para Entregar`
  String get sign_up_to_deliver {
    return Intl.message(
      'Regístrate para Entregar',
      name: 'sign_up_to_deliver',
      desc: '',
      args: [],
    );
  }

  /// `Saldo`
  String get balance {
    return Intl.message(
      'Saldo',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Compartir`
  String get share {
    return Intl.message(
      'Compartir',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Copiar Código`
  String get copy_code {
    return Intl.message(
      'Copiar Código',
      name: 'copy_code',
      desc: '',
      args: [],
    );
  }

  /// `Invitar a un Amigo`
  String get invite_friend {
    return Intl.message(
      'Invitar a un Amigo',
      name: 'invite_friend',
      desc: '',
      args: [],
    );
  }

  /// `Referido Incorrecto`
  String get referral_incorrect {
    return Intl.message(
      'Referido Incorrecto',
      name: 'referral_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Ir al Panel de Administración`
  String get go_to_admin_panel {
    return Intl.message(
      'Ir al Panel de Administración',
      name: 'go_to_admin_panel',
      desc: '',
      args: [],
    );
  }

  /// `El Correo ya Existe`
  String get email_already_exists {
    return Intl.message(
      'El Correo ya Existe',
      name: 'email_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Tu Solicitud Está Siendo Procesada`
  String get your_request_is_being_processed {
    return Intl.message(
      'Tu Solicitud Está Siendo Procesada',
      name: 'your_request_is_being_processed',
      desc: '',
      args: [],
    );
  }

  /// `Tiempo de Entrega Desde`
  String get delivery_time_from {
    return Intl.message(
      'Tiempo de Entrega Desde',
      name: 'delivery_time_from',
      desc: '',
      args: [],
    );
  }

  /// `Tiempo de Entrega Hasta`
  String get delivery_time_to {
    return Intl.message(
      'Tiempo de Entrega Hasta',
      name: 'delivery_time_to',
      desc: '',
      args: [],
    );
  }

  /// `Precio por KM`
  String get price_per_km {
    return Intl.message(
      'Precio por KM',
      name: 'price_per_km',
      desc: '',
      args: [],
    );
  }

  /// `Tipo de Tiempo de Entrega`
  String get delivery_time_type {
    return Intl.message(
      'Tipo de Tiempo de Entrega',
      name: 'delivery_time_type',
      desc: '',
      args: [],
    );
  }

  /// `Tamaño Recomendado`
  String get recommended_size {
    return Intl.message(
      'Tamaño Recomendado',
      name: 'recommended_size',
      desc: '',
      args: [],
    );
  }

  /// `Foto del Producto`
  String get product_picture {
    return Intl.message(
      'Foto del Producto',
      name: 'product_picture',
      desc: '',
      args: [],
    );
  }

  /// `Restaurante`
  String get restaurant {
    return Intl.message(
      'Restaurante',
      name: 'restaurant',
      desc: '',
      args: [],
    );
  }

  /// `Descripción`
  String get description {
    return Intl.message(
      'Descripción',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Nombre del Restaurante`
  String get restaurant_name {
    return Intl.message(
      'Nombre del Restaurante',
      name: 'restaurant_name',
      desc: '',
      args: [],
    );
  }

  /// `Zona Sin Conductor`
  String get no_driver_zone {
    return Intl.message(
      'Zona Sin Conductor',
      name: 'no_driver_zone',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad Mínima`
  String get min_qty {
    return Intl.message(
      'Cantidad Mínima',
      name: 'min_qty',
      desc: '',
      args: [],
    );
  }

  /// `Depósito y Retiro`
  String get deposit_withdrawal {
    return Intl.message(
      'Depósito y Retiro',
      name: 'deposit_withdrawal',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de Envio`
  String get payment_date {
    return Intl.message(
      'Fecha de Envio',
      name: 'payment_date',
      desc: '',
      args: [],
    );
  }

  /// `Transacciones`
  String get transactions {
    return Intl.message(
      'Transacciones',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Propietario`
  String get owner {
    return Intl.message(
      'Propietario',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar Usuario`
  String get delete_user {
    return Intl.message(
      'Eliminar Usuario',
      name: 'delete_user',
      desc: '',
      args: [],
    );
  }

  /// `Ingredientes`
  String get ingredients {
    return Intl.message(
      'Ingredientes',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Agregar Información de Dirección`
  String get add_address_information {
    return Intl.message(
      'Agregar Información de Dirección',
      name: 'add_address_information',
      desc: '',
      args: [],
    );
  }

  /// `Repetir Pedido`
  String get repeat_order {
    return Intl.message(
      'Repetir Pedido',
      name: 'repeat_order',
      desc: '',
      args: [],
    );
  }

  /// `Método de Pago Fallido`
  String get payment_method_failed {
    return Intl.message(
      'Método de Pago Fallido',
      name: 'payment_method_failed',
      desc: '',
      args: [],
    );
  }

  /// `Escribe Aquí`
  String get type_here {
    return Intl.message(
      'Escribe Aquí',
      name: 'type_here',
      desc: '',
      args: [],
    );
  }

  /// `Respuesta`
  String get answer {
    return Intl.message(
      'Respuesta',
      name: 'answer',
      desc: '',
      args: [],
    );
  }

  /// `Exitosamente`
  String get successfully {
    return Intl.message(
      'Exitosamente',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `¿Por Qué Quieres?`
  String get why_do_you_want {
    return Intl.message(
      '¿Por Qué Quieres?',
      name: 'why_do_you_want',
      desc: '',
      args: [],
    );
  }

  /// `Quererlo`
  String get want_it {
    return Intl.message(
      'Quererlo',
      name: 'want_it',
      desc: '',
      args: [],
    );
  }

  /// `Contar`
  String get count {
    return Intl.message(
      'Contar',
      name: 'count',
      desc: '',
      args: [],
    );
  }

  /// `Comprar Regalo`
  String get gift_buy {
    return Intl.message(
      'Comprar Regalo',
      name: 'gift_buy',
      desc: '',
      args: [],
    );
  }

  /// `El Tipo de Pago No Está Agregado`
  String get payment_type_is_not_added {
    return Intl.message(
      'El Tipo de Pago No Está Agregado',
      name: 'payment_type_is_not_added',
      desc: '',
      args: [],
    );
  }

  /// `No Puedes Crear un Pedido`
  String get you_cant_create_order {
    return Intl.message(
      'No Puedes Crear un Pedido',
      name: 'you_cant_create_order',
      desc: '',
      args: [],
    );
  }

  /// `No Hay Tipo de Pago`
  String get no_payment_type {
    return Intl.message(
      'No Hay Tipo de Pago',
      name: 'no_payment_type',
      desc: '',
      args: [],
    );
  }

  /// `Reembolso`
  String get refound {
    return Intl.message(
      'Reembolso',
      name: 'refound',
      desc: '',
      args: [],
    );
  }

  /// `Este Tiempo No Está Disponible`
  String get this_time_is_not_available {
    return Intl.message(
      'Este Tiempo No Está Disponible',
      name: 'this_time_is_not_available',
      desc: '',
      args: [],
    );
  }

  /// `Tienda y Restaurantes`
  String get shop_and_restaurants {
    return Intl.message(
      'Tienda y Restaurantes',
      name: 'shop_and_restaurants',
      desc: '',
      args: [],
    );
  }

  /// `Sin Conductor`
  String get no_driver {
    return Intl.message(
      'Sin Conductor',
      name: 'no_driver',
      desc: '',
      args: [],
    );
  }

  /// `Conductor`
  String get driver {
    return Intl.message(
      'Conductor',
      name: 'driver',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Tienes un Código Promocional`
  String get you_have_promo_code {
    return Intl.message(
      'Tienes un Código Promocional',
      name: 'you_have_promo_code',
      desc: '',
      args: [],
    );
  }

  /// `No Trabaja Mañana`
  String get not_work_tomorrow {
    return Intl.message(
      'No Trabaja Mañana',
      name: 'not_work_tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `No Trabaja Hoy`
  String get not_work_today {
    return Intl.message(
      'No Trabaja Hoy',
      name: 'not_work_today',
      desc: '',
      args: [],
    );
  }

  /// `No Trabaja Hoy y Mañana`
  String get not_work_today_and_tomorrow {
    return Intl.message(
      'No Trabaja Hoy y Mañana',
      name: 'not_work_today_and_tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Bono`
  String get bonus {
    return Intl.message(
      'Bono',
      name: 'bonus',
      desc: '',
      args: [],
    );
  }

  /// `Descuento Total`
  String get total_discount {
    return Intl.message(
      'Descuento Total',
      name: 'total_discount',
      desc: '',
      args: [],
    );
  }

  /// `Impuesto de Tienda`
  String get shop_tax {
    return Intl.message(
      'Impuesto de Tienda',
      name: 'shop_tax',
      desc: '',
      args: [],
    );
  }

  /// `Mínimo`
  String get min {
    return Intl.message(
      'Mínimo',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Otro`
  String get other {
    return Intl.message(
      'Otro',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Mañana`
  String get tomorrow {
    return Intl.message(
      'Mañana',
      name: 'tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Efectivo`
  String get cash {
    return Intl.message(
      'Efectivo',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Hoy`
  String get today {
    return Intl.message(
      'Hoy',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Tiempo de Entrega`
  String get time_delivery {
    return Intl.message(
      'Tiempo de Entrega',
      name: 'time_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Llamar al Soporte`
  String get call_to_support {
    return Intl.message(
      'Llamar al Soporte',
      name: 'call_to_support',
      desc: '',
      args: [],
    );
  }

  /// `¿Aún Tienes Preguntas?`
  String get still_have_questions {
    return Intl.message(
      '¿Aún Tienes Preguntas?',
      name: 'still_have_questions',
      desc: '',
      args: [],
    );
  }

  /// `No Encuentras la Respuesta`
  String get cant_find_the_answer {
    return Intl.message(
      'No Encuentras la Respuesta',
      name: 'cant_find_the_answer',
      desc: '',
      args: [],
    );
  }

  /// `Ordenar Ahora`
  String get order_now {
    return Intl.message(
      'Ordenar Ahora',
      name: 'order_now',
      desc: '',
      args: [],
    );
  }

  /// `No Hay Restaurantes`
  String get no_restaurant {
    return Intl.message(
      'No Hay Restaurantes',
      name: 'no_restaurant',
      desc: '',
      args: [],
    );
  }

  /// `Calificación del Mensajero`
  String get rating_courier {
    return Intl.message(
      'Calificación del Mensajero',
      name: 'rating_courier',
      desc: '',
      args: [],
    );
  }

  /// `Centro de Llamadas del Restaurante`
  String get call_center_restaurant {
    return Intl.message(
      'Centro de Llamadas del Restaurante',
      name: 'call_center_restaurant',
      desc: '',
      args: [],
    );
  }

  /// `Código Promocional`
  String get promo_code {
    return Intl.message(
      'Código Promocional',
      name: 'promo_code',
      desc: '',
      args: [],
    );
  }

  /// `Agregar Código Promocional`
  String get add_promo_code {
    return Intl.message(
      'Agregar Código Promocional',
      name: 'add_promo_code',
      desc: '',
      args: [],
    );
  }

  /// `Métodos de Pago`
  String get payment_methods {
    return Intl.message(
      'Métodos de Pago',
      name: 'payment_methods',
      desc: '',
      args: [],
    );
  }

  /// `Continuar al Pago`
  String get continue_to_payment {
    return Intl.message(
      'Continuar al Pago',
      name: 'continue_to_payment',
      desc: '',
      args: [],
    );
  }

  /// `Tus Pedidos`
  String get your_orders {
    return Intl.message(
      'Tus Pedidos',
      name: 'your_orders',
      desc: '',
      args: [],
    );
  }

  /// `Comentario`
  String get comment {
    return Intl.message(
      'Comentario',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Piso`
  String get floor {
    return Intl.message(
      'Piso',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `Casa`
  String get house {
    return Intl.message(
      'Casa',
      name: 'house',
      desc: '',
      args: [],
    );
  }

  /// `Oficina`
  String get office {
    return Intl.message(
      'Oficina',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Tu Tarjeta a Continuación`
  String get your_card_below {
    return Intl.message(
      'Tu Tarjeta a Continuación',
      name: 'your_card_below',
      desc: '',
      args: [],
    );
  }

  /// `¿Deseas Eliminarlo?`
  String get do_you_want_to_delete_it {
    return Intl.message(
      '¿Deseas Eliminarlo?',
      name: 'do_you_want_to_delete_it',
      desc: '',
      args: [],
    );
  }

  /// `CVC`
  String get cvc {
    return Intl.message(
      'CVC',
      name: 'cvc',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de Expiración`
  String get expired_date {
    return Intl.message(
      'Fecha de Expiración',
      name: 'expired_date',
      desc: '',
      args: [],
    );
  }

  /// `Nombre Completo`
  String get full_name {
    return Intl.message(
      'Nombre Completo',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Número de Tarjeta`
  String get card_number {
    return Intl.message(
      'Número de Tarjeta',
      name: 'card_number',
      desc: '',
      args: [],
    );
  }

  /// `Agregar Nueva Tarjeta`
  String get add_new_card {
    return Intl.message(
      'Agregar Nueva Tarjeta',
      name: 'add_new_card',
      desc: '',
      args: [],
    );
  }

  /// `Restaurante Favorito`
  String get liked_restaurant {
    return Intl.message(
      'Restaurante Favorito',
      name: 'liked_restaurant',
      desc: '',
      args: [],
    );
  }

  /// `Gestionar Pedido`
  String get manage_order {
    return Intl.message(
      'Gestionar Pedido',
      name: 'manage_order',
      desc: '',
      args: [],
    );
  }

  /// `Empezar`
  String get start {
    return Intl.message(
      'Empezar',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Empezar Pedido en Grupo`
  String get start_group_order {
    return Intl.message(
      'Empezar Pedido en Grupo',
      name: 'start_group_order',
      desc: '',
      args: [],
    );
  }

  /// `¿Realmente Quieres Limpiar la Tarjeta?`
  String get you_really_want_to_clear_the_card {
    return Intl.message(
      '¿Realmente Quieres Limpiar la Tarjeta?',
      name: 'you_really_want_to_clear_the_card',
      desc: '',
      args: [],
    );
  }

  /// `Cuota de Servicio`
  String get service_fee {
    return Intl.message(
      'Cuota de Servicio',
      name: 'service_fee',
      desc: '',
      args: [],
    );
  }

  /// `Número de Móvil`
  String get mobile_number {
    return Intl.message(
      'Número de Móvil',
      name: 'mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Número Alternativo`
  String get alternative_number {
    return Intl.message(
      'Número Alternativo',
      name: 'alternative_number',
      desc: '',
      args: [],
    );
  }

  /// `Configuraciones`
  String get settings {
    return Intl.message(
      'Configuraciones',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Todos los Restaurantes`
  String get all_restaurants {
    return Intl.message(
      'Todos los Restaurantes',
      name: 'all_restaurants',
      desc: '',
      args: [],
    );
  }

  /// `Noticias de la Semana`
  String get news_of_the_week {
    return Intl.message(
      'Noticias de la Semana',
      name: 'news_of_the_week',
      desc: '',
      args: [],
    );
  }

  /// `Enviar Nuevo`
  String get send_new {
    return Intl.message(
      'Enviar Nuevo',
      name: 'send_new',
      desc: '',
      args: [],
    );
  }

  /// `Enviamos el Código OTP a`
  String get we_are_send_OTP_code_to {
    return Intl.message(
      'Enviamos el Código OTP a',
      name: 'we_are_send_OTP_code_to',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar Código OTP`
  String get enter_OTP_code {
    return Intl.message(
      'Ingresar Código OTP',
      name: 'enter_OTP_code',
      desc: '',
      args: [],
    );
  }

  /// `País`
  String get country {
    return Intl.message(
      'País',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `O Acceder Rápidamente`
  String get or_access_quickly {
    return Intl.message(
      'O Acceder Rápidamente',
      name: 'or_access_quickly',
      desc: '',
      args: [],
    );
  }

  /// `Mantenerme Conectado`
  String get keep_me_logged_in {
    return Intl.message(
      'Mantenerme Conectado',
      name: 'keep_me_logged_in',
      desc: '',
      args: [],
    );
  }

  /// `Lista de Tiendas`
  String get shop_list {
    return Intl.message(
      'Lista de Tiendas',
      name: 'shop_list',
      desc: '',
      args: [],
    );
  }

  /// `Ver Mapa`
  String get view_map {
    return Intl.message(
      'Ver Mapa',
      name: 'view_map',
      desc: '',
      args: [],
    );
  }

  /// `Dirección`
  String get address {
    return Intl.message(
      'Dirección',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Información Personal`
  String get personal_information {
    return Intl.message(
      'Información Personal',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Tiendas Guardadas`
  String get saved_stores {
    return Intl.message(
      'Tiendas Guardadas',
      name: 'saved_stores',
      desc: '',
      args: [],
    );
  }

  /// `Productos Vistos`
  String get viewed_products {
    return Intl.message(
      'Productos Vistos',
      name: 'viewed_products',
      desc: '',
      args: [],
    );
  }

  /// `Historial de la Cartera`
  String get wallet_history {
    return Intl.message(
      'Historial de la Cartera',
      name: 'wallet_history',
      desc: '',
      args: [],
    );
  }

  /// `Ubicaciones Guardadas`
  String get saved_locations {
    return Intl.message(
      'Ubicaciones Guardadas',
      name: 'saved_locations',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Sin Cartera`
  String get no_wallet {
    return Intl.message(
      'Sin Cartera',
      name: 'no_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Configuraciones del Sistema`
  String get system_settings {
    return Intl.message(
      'Configuraciones del Sistema',
      name: 'system_settings',
      desc: '',
      args: [],
    );
  }

  /// `Siguiente`
  String get next {
    return Intl.message(
      'Siguiente',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar Sesión`
  String get login {
    return Intl.message(
      'Iniciar Sesión',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Correo Electrónico`
  String get email {
    return Intl.message(
      'Correo Electrónico',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Olvidé mi Contraseña`
  String get forgot_password {
    return Intl.message(
      'Olvidé mi Contraseña',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Continuar con Google`
  String get continue_with_google {
    return Intl.message(
      'Continuar con Google',
      name: 'continue_with_google',
      desc: '',
      args: [],
    );
  }

  /// `¿No Tienes una Cuenta?`
  String get dont_have_an_account {
    return Intl.message(
      '¿No Tienes una Cuenta?',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Registrar`
  String get register {
    return Intl.message(
      'Registrar',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar una Dirección de Entrega`
  String get enter_a_delivery_address {
    return Intl.message(
      'Ingresar una Dirección de Entrega',
      name: 'enter_a_delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar Ubicación`
  String get confirm_location {
    return Intl.message(
      'Confirmar Ubicación',
      name: 'confirm_location',
      desc: '',
      args: [],
    );
  }

  /// `Título`
  String get title {
    return Intl.message(
      'Título',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Guardar`
  String get save {
    return Intl.message(
      'Guardar',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Buscar Restaurante y Productos`
  String get search_restaurant_and_products {
    return Intl.message(
      'Buscar Restaurante y Productos',
      name: 'search_restaurant_and_products',
      desc: '',
      args: [],
    );
  }

  /// `Abierto Ahora`
  String get open_now {
    return Intl.message(
      'Abierto Ahora',
      name: 'open_now',
      desc: '',
      args: [],
    );
  }

  /// `Trabajo 24/7`
  String get work_247 {
    return Intl.message(
      'Trabajo 24/7',
      name: 'work_247',
      desc: '',
      args: [],
    );
  }

  /// `Recoger en`
  String get pickup_at {
    return Intl.message(
      'Recoger en',
      name: 'pickup_at',
      desc: '',
      args: [],
    );
  }

  /// `Moneda`
  String get currency {
    return Intl.message(
      'Moneda',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Tema`
  String get theme {
    return Intl.message(
      'Tema',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Categorías`
  String get categories {
    return Intl.message(
      'Categorías',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Marcas`
  String get brands {
    return Intl.message(
      'Marcas',
      name: 'brands',
      desc: '',
      args: [],
    );
  }

  /// `No Hay Artículos en el`
  String get there_are_no_items_in_the {
    return Intl.message(
      'No Hay Artículos en el',
      name: 'there_are_no_items_in_the',
      desc: '',
      args: [],
    );
  }

  /// `Tiendas Abiertas Ahora`
  String get open_now_shops {
    return Intl.message(
      'Tiendas Abiertas Ahora',
      name: 'open_now_shops',
      desc: '',
      args: [],
    );
  }

  /// `Tiendas Nuevas`
  String get new_shops {
    return Intl.message(
      'Tiendas Nuevas',
      name: 'new_shops',
      desc: '',
      args: [],
    );
  }

  /// `Perfil`
  String get profile {
    return Intl.message(
      'Perfil',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Productos Gustados`
  String get liked_products {
    return Intl.message(
      'Productos Gustados',
      name: 'liked_products',
      desc: '',
      args: [],
    );
  }

  /// `Todas las Tiendas`
  String get all_stores {
    return Intl.message(
      'Todas las Tiendas',
      name: 'all_stores',
      desc: '',
      args: [],
    );
  }

  /// `Ir a Pagar`
  String get go_to_checkout {
    return Intl.message(
      'Ir a Pagar',
      name: 'go_to_checkout',
      desc: '',
      args: [],
    );
  }

  /// `Mi Pedido`
  String get my_order {
    return Intl.message(
      'Mi Pedido',
      name: 'my_order',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar Todo`
  String get delete_all {
    return Intl.message(
      'Eliminar Todo',
      name: 'delete_all',
      desc: '',
      args: [],
    );
  }

  /// `En`
  String get in_ {
    return Intl.message(
      'En',
      name: 'in_',
      desc: '',
      args: [],
    );
  }

  /// `Información de la Tienda`
  String get store_info {
    return Intl.message(
      'Información de la Tienda',
      name: 'store_info',
      desc: '',
      args: [],
    );
  }

  /// `Tiempos de Entrega de la Tienda`
  String get store_delivery_times {
    return Intl.message(
      'Tiempos de Entrega de la Tienda',
      name: 'store_delivery_times',
      desc: '',
      args: [],
    );
  }

  /// `Guardado`
  String get saved {
    return Intl.message(
      'Guardado',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Ver Más`
  String get see_more {
    return Intl.message(
      'Ver Más',
      name: 'see_more',
      desc: '',
      args: [],
    );
  }

  /// `Productos Más Vendidos`
  String get most_sold_products {
    return Intl.message(
      'Productos Más Vendidos',
      name: 'most_sold_products',
      desc: '',
      args: [],
    );
  }

  /// `Escribir Comentario`
  String get write_comment {
    return Intl.message(
      'Escribir Comentario',
      name: 'write_comment',
      desc: '',
      args: [],
    );
  }

  /// `Mejores Ventas`
  String get top_sales {
    return Intl.message(
      'Mejores Ventas',
      name: 'top_sales',
      desc: '',
      args: [],
    );
  }

  /// `Productos Nuevos`
  String get new_products {
    return Intl.message(
      'Productos Nuevos',
      name: 'new_products',
      desc: '',
      args: [],
    );
  }

  /// `Tiempos de Entrega`
  String get delivery_times {
    return Intl.message(
      'Tiempos de Entrega',
      name: 'delivery_times',
      desc: '',
      args: [],
    );
  }

  /// `Tienda`
  String get store {
    return Intl.message(
      'Tienda',
      name: 'store',
      desc: '',
      args: [],
    );
  }

  /// `Rango de Entrega`
  String get delivery_range {
    return Intl.message(
      'Rango de Entrega',
      name: 'delivery_range',
      desc: '',
      args: [],
    );
  }

  /// `Teléfono`
  String get phone {
    return Intl.message(
      'Teléfono',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Buscar`
  String get search {
    return Intl.message(
      'Buscar',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Verifica tu Conexión de Red`
  String get check_your_network_connection {
    return Intl.message(
      'Verifica tu Conexión de Red',
      name: 'check_your_network_connection',
      desc: '',
      args: [],
    );
  }

  /// `Algo Salió Mal con el Servidor`
  String get something_went_wrong_with_the_server {
    return Intl.message(
      'Algo Salió Mal con el Servidor',
      name: 'something_went_wrong_with_the_server',
      desc: '',
      args: [],
    );
  }

  /// `Precio Total del Producto`
  String get total_product_price {
    return Intl.message(
      'Precio Total del Producto',
      name: 'total_product_price',
      desc: '',
      args: [],
    );
  }

  /// `Impuesto Total del Producto`
  String get total_product_tax {
    return Intl.message(
      'Impuesto Total del Producto',
      name: 'total_product_tax',
      desc: '',
      args: [],
    );
  }

  /// `Impuesto Total de la Tienda`
  String get total_shop_tax {
    return Intl.message(
      'Impuesto Total de la Tienda',
      name: 'total_shop_tax',
      desc: '',
      args: [],
    );
  }

  /// `Tarifa de Entrega`
  String get delivery_fee {
    return Intl.message(
      'Tarifa de Entrega',
      name: 'delivery_fee',
      desc: '',
      args: [],
    );
  }

  /// `Cupón`
  String get coupon {
    return Intl.message(
      'Cupón',
      name: 'coupon',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad Total`
  String get total_amount {
    return Intl.message(
      'Cantidad Total',
      name: 'total_amount',
      desc: '',
      args: [],
    );
  }

  /// `Tienda`
  String get shop {
    return Intl.message(
      'Tienda',
      name: 'shop',
      desc: '',
      args: [],
    );
  }

  /// `Impuesto Total`
  String get total_tax {
    return Intl.message(
      'Impuesto Total',
      name: 'total_tax',
      desc: '',
      args: [],
    );
  }

  /// `Precio Total`
  String get total_price {
    return Intl.message(
      'Precio Total',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `Gratis`
  String get free {
    return Intl.message(
      'Gratis',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Nota del Producto`
  String get product_note {
    return Intl.message(
      'Nota del Producto',
      name: 'product_note',
      desc: '',
      args: [],
    );
  }

  /// `Entrega`
  String get delivery {
    return Intl.message(
      'Entrega',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Sin Resultados de Búsqueda`
  String get no_search_results {
    return Intl.message(
      'Sin Resultados de Búsqueda',
      name: 'no_search_results',
      desc: '',
      args: [],
    );
  }

  /// `Banner`
  String get banner {
    return Intl.message(
      'Banner',
      name: 'banner',
      desc: '',
      args: [],
    );
  }

  /// `Información General`
  String get general_info {
    return Intl.message(
      'Información General',
      name: 'general_info',
      desc: '',
      args: [],
    );
  }

  /// `Género`
  String get gender {
    return Intl.message(
      'Género',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Hombre`
  String get male {
    return Intl.message(
      'Hombre',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Mujer`
  String get female {
    return Intl.message(
      'Mujer',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de Nacimiento`
  String get date_of_birth {
    return Intl.message(
      'Fecha de Nacimiento',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Sin Conexión a Internet`
  String get no_internet_connection {
    return Intl.message(
      'Sin Conexión a Internet',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Confirmación`
  String get confirmation {
    return Intl.message(
      'Confirmación',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `No Encontrado`
  String get not_found {
    return Intl.message(
      'No Encontrado',
      name: 'not_found',
      desc: '',
      args: [],
    );
  }

  /// `Correo No Verificado Aún`
  String get email_not_verified_yet {
    return Intl.message(
      'Correo No Verificado Aún',
      name: 'email_not_verified_yet',
      desc: '',
      args: [],
    );
  }

  /// `El Correo No es Válido`
  String get email_is_not_valid {
    return Intl.message(
      'El Correo No es Válido',
      name: 'email_is_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `La Contraseña Debe Contener Mínimo 8 Caracteres`
  String get password_should_contain_minimum_8_characters {
    return Intl.message(
      'La Contraseña Debe Contener Mínimo 8 Caracteres',
      name: 'password_should_contain_minimum_8_characters',
      desc: '',
      args: [],
    );
  }

  /// `El Número de Teléfono No es Válido`
  String get phone_number_is_not_valid {
    return Intl.message(
      'El Número de Teléfono No es Válido',
      name: 'phone_number_is_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `El Código de Confirmación No Está Presente`
  String get confirmation_code_is_not_present {
    return Intl.message(
      'El Código de Confirmación No Está Presente',
      name: 'confirmation_code_is_not_present',
      desc: '',
      args: [],
    );
  }

  /// `La Confirmación de la Contraseña No es Igual`
  String get confirm_password_is_not_the_same {
    return Intl.message(
      'La Confirmación de la Contraseña No es Igual',
      name: 'confirm_password_is_not_the_same',
      desc: '',
      args: [],
    );
  }

  /// `Error al Actualizar la Contraseña`
  String get error_with_updating_password {
    return Intl.message(
      'Error al Actualizar la Contraseña',
      name: 'error_with_updating_password',
      desc: '',
      args: [],
    );
  }

  /// `Nota`
  String get note {
    return Intl.message(
      'Nota',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `No se Encontró Dirección`
  String get no_address_found {
    return Intl.message(
      'No se Encontró Dirección',
      name: 'no_address_found',
      desc: '',
      args: [],
    );
  }

  /// `Encuesta`
  String get survey {
    return Intl.message(
      'Encuesta',
      name: 'survey',
      desc: '',
      args: [],
    );
  }

  /// `Estadísticas`
  String get statistics {
    return Intl.message(
      'Estadísticas',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `Recibido`
  String get received {
    return Intl.message(
      'Recibido',
      name: 'received',
      desc: '',
      args: [],
    );
  }

  /// `Notificación Push`
  String get push_notification {
    return Intl.message(
      'Notificación Push',
      name: 'push_notification',
      desc: '',
      args: [],
    );
  }

  /// `Puntos`
  String get points {
    return Intl.message(
      'Puntos',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Estado`
  String get status {
    return Intl.message(
      'Estado',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Pendiente`
  String get pending {
    return Intl.message(
      'Pendiente',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Aprobado`
  String get approved {
    return Intl.message(
      'Aprobado',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `Rechazado`
  String get rejected {
    return Intl.message(
      'Rechazado',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `Precio`
  String get price {
    return Intl.message(
      'Precio',
      name: 'price',
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
