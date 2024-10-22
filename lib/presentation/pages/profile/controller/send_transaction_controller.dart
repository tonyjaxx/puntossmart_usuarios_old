import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/profile/model/send_transaction_model.dart';
import 'package:http/http.dart' as http;

class SendTransactionController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<SendTransactionModel?> sendTransactionModel = Rx(null);
  getSendTrasactions() async {
    try {
      isLoading(true);
      String url =
          "${AppConstants.baseUrl}/api/v1/dashboard/user/walletSendHistories";
      print("------$url-----");
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorage.getToken()}',
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        sendTransactionModel.value =
            SendTransactionModel.fromJson(responseData);
        log("$responseData");
      } else {
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in send transactions: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSendTrasactions();
  }
}
