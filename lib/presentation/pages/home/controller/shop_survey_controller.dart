import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/home/model/shop_survey_model.dart';
import 'package:http/http.dart' as http;

class ShopSurveyController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<SurveyShopModel> shopSurveyModelList = RxList<SurveyShopModel>();

  getSurveyShops() async {
    try {
      isLoading(true);
      String url = "${AppConstants.baseUrl}/api/v1/rest/getShopsWithSurveys";
      log("------$url-----");
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorage.getToken()}',
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        shopSurveyModelList.value = responseData
            .map<SurveyShopModel>((json) => SurveyShopModel.fromJson(json))
            .toList();
        print("URL :: $url :: RESPONSE :: $responseData");
      } else {
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in get Survey Shops: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getSurveyShops();
    super.onInit();
  }
}
