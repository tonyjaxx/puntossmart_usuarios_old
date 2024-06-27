import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:puntossmart/infrastructure/services/app_constants.dart';
import 'package:puntossmart/infrastructure/services/local_storage.dart';
import 'package:puntossmart/presentation/pages/friends/models/get_friend_model.dart';
import 'package:puntossmart/presentation/pages/friends/models/get_user_model.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';

class FriendController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool addFriendLoading = false.obs;
  RxBool sendPointLoading = false.obs;
  TextEditingController noteController = TextEditingController();
  Rx<GetFriendModel?> getFriendModel = Rx<GetFriendModel?>(null);
  Future<void> getFriends() async {
    try {
      addFriendLoading(true);
      String url =
          "${AppConstants.baseUrl}/api/v1/dashboard/user/profile/getFriends";
      print("------$url-----");
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorage.getToken()}',
        },
        body: {
          'user_id': LocalStorage.getUserId().toString(),
        },
      );
      var responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        getFriendModel.value = GetFriendModel.fromJson(responseData);
        print(responseData);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getAllUsers: $e');
    } finally {
      addFriendLoading(false);
    }
  }

  Rx<GetUserModel?> getUserModel = Rx<GetUserModel?>(null);
  Future<void> getAllUsers() async {
    try {
      isLoading(true);
      String url =
          "${AppConstants.baseUrl}/api/v1/dashboard/user/profile/getUsers";
      print("------$url-----");
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${LocalStorage.getToken()}',
        },
        body: {
          'user_id': LocalStorage.getUserId().toString(),
        },
      );
      var responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        getUserModel.value = GetUserModel.fromJson(responseData);
        print(responseData);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getAllUsers: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addNewFriend({required String receivedUserID}) async {
    try {
      addFriendLoading(true);
      String? userID = LocalStorage.getUserId().toString();
      String? token = LocalStorage.getToken();

      String url =
          "${AppConstants.baseUrl}/api/v1/dashboard/user/profile/addFriend";
      var data = {
        'send_request_user_id': userID,
        'recevied_request_user_id': receivedUserID,
      };

      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        print("URL: $url, DATA: $data, AUTH: $token");
        getAllUsers();
        getFriends();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in Add Friends: $e');
    } finally {
      addFriendLoading(false);
    }
  }

  Future<void> sendPoints(
      {required String uuid, required String points}) async {
    if (noteController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter your note",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
          backgroundColor: AppStyle.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      try {
        sendPointLoading(true);
        String? userID = LocalStorage.getUserId().toString();
        String? token = LocalStorage.getToken();

        String url =
            "${AppConstants.baseUrl}/api/v1/dashboard/user/profile/$uuid/sendPoints";
        var data = {
          'note': noteController.text,
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

        if (response.statusCode == 200) {
          print("URL: $url, DATA: $data, AUTH: $token");
          noteController.clear();

          getAllUsers();
          getFriends();
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        print('Error in Add Friends: $e');
      } finally {
        sendPointLoading(false);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllUsers();
    getFriends();
  }
}
