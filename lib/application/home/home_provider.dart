import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puntossmart/domain/di/dependency_manager.dart';

import 'home_notifier.dart';
import 'home_state.dart';

final homeProvider = StateNotifierProvider.autoDispose<HomeNotifier, HomeState>(
  (ref) =>
      HomeNotifier(categoriesRepository, bannersRepository, shopsRepository),
);
