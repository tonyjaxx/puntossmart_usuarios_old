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
import 'package:url_launcher/url_launcher.dart';

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
        openWhatsapp(
          phone: "+51904244903", //numero bot smarter
          packageName: packageName,
          points: "$points",
          pens: "$pens",
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

  Future<void> openWhatsapp(
      {required String phone,
      required String packageName,
      required String points,
      required String pens}) async {
    final String phoneNumber = phone;
    final String firstName = LocalStorage.getFirstName().toString();
    final String lastName = LocalStorage.getLastName().toString();
    final String message = Uri.encodeComponent(
      '🌟 *Comprar Paquete De Puntos Smart* 🌟\n\n'
      'Hola Super Agente Smart!!,\n\n'
      'Me Gustaría Comprar $packageName  de Puntos Smart. 🎉\n\n'
      'Este Paquete Provee $points Puntos Smart Y Tiene un valor de  $pens PENs. Con Estos Puntos Smart Podrás Obtener Miles de beneficios y Cupones de descuento En El Ecosistema de Puntos Smart.\n\n'
      'Por Favor Procede con mi compra lo más pronto posible.\n\n'
      '¡Muchas Gracias!*\n\n'
      '$firstName $lastName',
    );

    final String url = "https://wa.me/$phoneNumber?text=$message";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPackages();
    getBuyHistory();
  }
}
