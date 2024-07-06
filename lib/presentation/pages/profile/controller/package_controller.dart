import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/profile/model/buy_history_model.dart';
import 'package:puntossmart/presentation/pages/profile/model/package_model.dart';
import 'package:http/http.dart' as http;

class PackageController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<PackageModel?> packageModel = Rx(null);
  getPackages() async {
    try {
      isLoading(true);
      String url =
          "${AppConstants.baseUrl}/api/v1/dashboard/user/profile/getPackages";
      print("------$url-----");
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorage.getToken()}',
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        packageModel.value = PackageModel.fromJson(responseData);
        log("$responseData");
      } else {
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in fetch package: $e');
    } finally {
      isLoading(false);
    }
  }

  Rx<BuyHistoryModel?> buyHistoryModel = Rx(null);
  getBuyHistory() async {
    try {
      isLoading(true);
      String url =
          "${AppConstants.baseUrl}/api/v1/dashboard/user/profile/getPackagesHistory";
      print("------$url-----");
      var response = await http.post(Uri.parse(url), headers: {
        'Authorization': 'Bearer ${LocalStorage.getToken()}',
      }, body: {
        'user_id': LocalStorage.getUserId().toString(),
      });
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        buyHistoryModel.value = BuyHistoryModel.fromJson(responseData);
        log("$responseData");
      } else {
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in fetch history: $e');
    } finally {
      isLoading(false);
    }
  }

  RxBool requestLoding = false.obs;
  sendBuyRequest(context,
      {required int packageID,
      required String packageName,
      required int points,
      required int pens}) async {
    try {
      requestLoding(true);
      String url =
          "${AppConstants.baseUrl}/api/v1/dashboard/user/profile/submitPackageRequest";
      print("------$url-----");
      var response = await http.post(Uri.parse(url), headers: {
        'Authorization': 'Bearer ${LocalStorage.getToken()}',
      }, body: {
        'package_id': packageID.toString(),
        'user_id': LocalStorage.getUserId().toString(),
      });
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        getBuyHistory();
        Navigator.of(context).pop();
        await FlutterShare.share(
          title: 'Buy Punto Smart',
          text: '🌟 *Buy Punto Smart* 🌟\n\n'
              'Hello,\n\n'
              'I would like to purchase the *$packageName* Puntos Smart. 🎉\n\n'
              'This package provides *$points* points and is valued at *$pens* PENs. These points will allow me to enjoy numerous benefits and exclusive rewards within the Punto Smart ecosystem.\n\n'
              'Please proceed with my request at your earliest convenience. I am eager to start utilizing the benefits of this package.\n\n'
              '*Thank you!*\n\n'
              '${LocalStorage.getFirstName().toString()} ${LocalStorage.getLastName().toString()}',
        );
        log("$responseData");
      } else {
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in fetch history: $e');
    } finally {
      requestLoding(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPackages();
    getBuyHistory();
  }
}
