import 'package:puntossmart/infrastructure/models/models.dart';
import '../../domain/handlers/handlers.dart';

abstract class CurrenciesRepositoryFacade {
  Future<ApiResult<CurrenciesResponse>> getCurrencies();
}
