import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:puntossmart/domain/di/injection.dart';
import 'package:puntossmart/domain/handlers/http_service.dart';
import 'package:puntossmart/domain/handlers/network_exceptions.dart';
import 'package:puntossmart/domain/iterface/draw.dart';
import 'package:puntossmart/infrastructure/models/response/draw_routing_response.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';

import '../../domain/handlers/api_result.dart';

class DrawRepository implements DrawRepositoryFacade {
  @override
  Future<ApiResult<DrawRouting>> getRouting({
    required LatLng start,
    required LatLng end,
  }) async {
    try {
      final client =
          inject<HttpService>().client(requireAuth: false, routing: true);
      final response = await client.get(
        '/v2/directions/driving-car?api_key=${AppConstants.routingKey}&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}',
      );
      return ApiResult.success(
        data: DrawRouting.fromJson(response.data),
      );
    } catch (e) {
      return ApiResult.failure(
          error: (e.runtimeType == DioException)
              ? ((e as DioException).response?.data["message"] == "Bad request."
                  ? (e.response?.data["params"] as Map).values.first[0]
                  : e.response?.data["message"])
              : e.toString(),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
