import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/home_three/model/promotion_model.dart';

class PromotionController extends GetxController {
  RxBool promotionLoading = false.obs;
  Rx<PromotionModel?> promotionModel = Rx(null);
  getPromotionVideo() async {
    try {
      promotionLoading(true);
      String url =
          "${AppConstants.baseUrl}/api/v1/dashboard/user/profile/getPromotionVideo";
      debugPrint("------$url-----");
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorage.getToken()}',
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        promotionModel.value = PromotionModel.fromJson(responseData);
        log("$responseData");
      } else {
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in fetch package: $e');
    } finally {
      promotionLoading(false);
    }
  }

  Future<void> getPromotionPoints(
    context, {
    required String points,
    required String userID,
  }) async {
    try {
      promotionLoading(true);
      String? uuid = LocalStorage.getUserUuid().toString();
      String? token = LocalStorage.getToken();

      String url =
          "${AppConstants.baseUrl}/api/v1/dashboard/user/profile/$uuid/sendPoints";
      var data = {
        'note': "promotion points",
        'price': points,
        'user_id': userID,
      };

      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data,
      );
      var responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        log("URL: $url, DATA: $data, RESPONSE: $responseData");
        AppHelpers.showCheckTopSnackBarDone(
          context,
          "Thanks for Watching our Promotions",
        );
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in Add Friends: $e');
    } finally {
      promotionLoading(false);
    }
  }

  @override
  void onInit() {
    getPromotionVideo();
    super.onInit();
  }
}
