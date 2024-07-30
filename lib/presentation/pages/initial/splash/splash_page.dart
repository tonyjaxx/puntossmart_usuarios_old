import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puntossmart/presentation/routes/app_router.dart';
import '../../../../application/splash/splash_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(Duration(seconds: 3), () { //7
        ref.read(splashProvider.notifier).getTranslations(context);
        ref.read(splashProvider.notifier).getToken(context, goMain: () {
          FlutterNativeSplash.remove();
          context.replaceRoute(const MainRoute());
        }, goLogin: () {
          FlutterNativeSplash.remove();
          context.replaceRoute(const LoginRoute());
        }, goNoInternet: () {
          FlutterNativeSplash.remove();
          context.replaceRoute(const NoConnectionRoute());
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Image.asset("assets/images/splash.gif", fit: BoxFit.cover);
  }
}
