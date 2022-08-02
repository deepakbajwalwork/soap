import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:souapp/helpers/end_points.dart';
import 'package:souapp/helpers/network_manager.dart';
import 'package:souapp/utils/app_snackbar.dart';
import 'package:souapp/views/verification_screen.dart';

class SignUpController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool passwordVisible = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);

  // Signup API
  Future signUP({required refresh, required email, required password}) async {
    var request = {
      "email": emailIdController.text,
      "password": passwordController.text,
    };
    await NetworkManager.instance.getDio().post(Endpoints.register, data: request).then((response) async {

      print(response.data.toString());
      if (response.data['success'] == true) {
        AppSnackbar.showSnackbar("Message", response.data['message'], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
        Get.to(() => VerificationScreen(email: email, password: password));
      } else {
        AppSnackbar.showSnackbar("Error", 'User Already Exist', AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    }).onError((dio.DioError error, stackTrace) async {
      AppSnackbar.showSnackbar("Error", 'User Already Exist', AlertType.error);
    });
    update();
  }
}
