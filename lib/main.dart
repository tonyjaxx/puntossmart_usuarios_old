import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/theme/theme.dart';
import 'package:upgrader/upgrader.dart';
import 'domain/di/dependency_manager.dart';
import 'presentation/app_widget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
// l
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBk8bkWJyOKu-7UPQdZdWWxoLUilL8AD6I',
        appId: '1:425054115382:ios:e06f9f17ee70e039ebea97',
        messagingSenderId: '425054115382',
        projectId: 'puntos-smart-650e5',
        storageBucket: 'puntos-smart-650e5.appspot.com',
        androidClientId:
            '425054115382-2r8e4beooo33iq0nun9aelj9pgld6b4p.apps.googleusercontent.com',
        iosClientId:
            '425054115382-gh5pnno2d7mpmir9et7lamat2h31deq2.apps.googleusercontent.com',
        iosBundleId: 'com.puntossmart.puntossmart.v2',
      ),
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Upgrader.clearSavedSettings();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppStyle.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  await LocalStorage.init();
  setUpDependencies();
  runApp(ProviderScope(child: AppWidget()));
}
