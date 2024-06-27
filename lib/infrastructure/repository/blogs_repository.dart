import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:puntossmart/domain/di/injection.dart';
import 'package:puntossmart/domain/handlers/http_service.dart';
import 'package:puntossmart/domain/iterface/blogs.dart';
import 'package:puntossmart/infrastructure/models/models.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import '../../../domain/handlers/handlers.dart';

class BlogsRepository implements BlogsRepositoryFacade {
  @override
  Future<ApiResult<BlogsPaginateResponse>> getBlogs(
    int page,
    String type,
  ) async {
    final data = {
      'perPage': 15,
      'page': page,
      'type': type,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/blogs/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BlogsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get blogs paginate failure: $e');
      return ApiResult.failure(
          error: (e.runtimeType == DioException)
              ? ((e as DioException).response?.data["message"] == "Bad request."
                  ? (e.response?.data["params"] as Map).values.first[0]
                  : e.response?.data["message"])
              : "",
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<BlogDetailsResponse>> getBlogDetails(String uuid) async {
    final data = {'lang': LocalStorage.getLanguage()?.locale};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response =
          await client.get('/api/v1/rest/blogs/$uuid', queryParameters: data);
      return ApiResult.success(
        data: BlogDetailsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get blogs details failure: $e');
      return ApiResult.failure(
          error: (e.runtimeType == DioException)
              ? ((e as DioException).response?.data["message"] == "Bad request."
                  ? (e.response?.data["params"] as Map).values.first[0]
                  : e.response?.data["message"])
              : "",
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
