import 'package:get/get.dart';
import 'package:puntossmart/presentation/pages/profile/model/send_transaction_model.dart';

class SendTransactionController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<SendTransactionModel?> sendTransactionModel = Rx(null);
  getSendTrasactions() {}
}
