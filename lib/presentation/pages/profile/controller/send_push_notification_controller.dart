import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendPushNotificationController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxInt age = 0.obs;
  RxString gender = 'male'.obs;
}
