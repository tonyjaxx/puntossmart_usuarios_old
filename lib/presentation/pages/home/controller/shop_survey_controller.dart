import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/app_helpers.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/home/model/shop_survey_model.dart';
import 'package:http/http.dart' as http;
import 'package:puntossmart/presentation/pages/home/model/shop_wise_survey_model.dart';
import 'package:puntossmart/presentation/pages/home/model/survey_question_answer_model.dart';
import 'package:puntossmart/presentation/pages/home/model/user_completed_survey_by_shop.dart';

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

  Rx<ShopWiseSurveyModel?> shopWiseSurveyModel = Rx(null);
  getSurveysByShopId({required int shopID}) async {
    try {
      isLoading(true);
      String url = "${AppConstants.baseUrl}/api/v1/rest/getSurveysByShopId";
      log("------$url-----");
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorage.getToken()}',
        },
        body: {
          "shop_id": shopID.toString(),
          "user_id": LocalStorage.getUserId().toString(),
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        shopWiseSurveyModel.value = ShopWiseSurveyModel.fromJson(responseData);
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

  Rx<UserCompletedSurveysByShopModel?> userCompletedSurveysByShopModel =
      Rx(null);
  getUserCompletedSurveysByShop({required int shopID}) async {
    try {
      isLoading(true);
      String url =
          "${AppConstants.baseUrl}/api/v1/rest/getUserCompletedSurveysByShop";
      log("------$url-----");
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorage.getToken()}',
        },
        body: {
          "shop_id": shopID.toString(),
          "user_id": LocalStorage.getUserId().toString(),
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        userCompletedSurveysByShopModel.value =
            UserCompletedSurveysByShopModel.fromJson(responseData);
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

  Rx<SurveyQuestionAnswerModel?> surveyQuestionAnswerModel = Rx(null);
  Map<int, Rx<int?>> selectedAnswers = {};
  Map<int, int> selectedPoints =
      {}; // Map to store selected points for each question

  getSurveysQuestionAnswer({required int surveyID}) async {
    try {
      isLoading(true);
      String url =
          "${AppConstants.baseUrl}/api/v1/rest/getQuestionsAndAnswersBySurveyId";
      log("------$url-----");
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorage.getToken()}',
        },
        body: {
          "survey_id": surveyID.toString(),
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        surveyQuestionAnswerModel.value =
            SurveyQuestionAnswerModel.fromJson(responseData);
        // Initialize selectedAnswers and selectedPoints with null and 0 for each question respectively
        surveyQuestionAnswerModel.value?.questions
            ?.asMap()
            .forEach((index, question) {
          selectedAnswers[index] = Rx<int?>(null);
          selectedPoints[index] = 0;
        });
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

  RxBool surveyLoading = false.obs;
  void submitSurvey({
    required String surveyID,
    required String points,
    required String note,
    required BuildContext context,
  }) async {
    try {
      surveyLoading(true);

      String url = "${AppConstants.baseUrl}/api/v1/rest/submitSurvey";
      log("Request URL: $url");
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorage.getToken()}',
        },
        body: {
          "user_id": LocalStorage.getUserId().toString(),
          "survey_id": surveyID.toString(),
          "points": points.toString(),
          "note": note.toString(),
          "uuid": LocalStorage.getUserUuid().toString(),
        },
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("Survey submitted successfully.");
        print("URL :: $url ::Response:: $responseData");
        getSurveysByShopId(shopID: responseData['shop_id']);
        getUserCompletedSurveysByShop(shopID: responseData['shop_id']);
        AppHelpers.showCheckTopSnackBarDone(
            context, "Encuesta enviada con éxito.");
        Navigator.of(context).pop();
      } else {
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in submitSurvey: $e');
    } finally {
      surveyLoading(false);
    }
  }

  void setSelectedAnswer(int questionIndex, int value, String points) {
    selectedAnswers[questionIndex]?.value = value;
    selectedPoints[questionIndex] = int.parse(points); // Store the points
  }

  int calculateTotalPoints() {
    int totalPoints = 0;
    selectedPoints.forEach((key, value) {
      totalPoints += value;
    });
    return totalPoints;
  }

  @override
  void onInit() {
    getSurveyShops();
    super.onInit();
  }
}
