import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:souapp/helpers/end_points.dart';
import 'package:souapp/helpers/network_manager.dart';
import 'package:souapp/utils/app_snackbar.dart';
import 'package:souapp/views/bankinfosignup_screen.dart';
import 'package:souapp/views/signin_screen.dart';
import 'package:souapp/views/verification_screen.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  // Forgot Password API
  Future forgotPassword({required refresh}) async {
    var request = {
      "email": emailController.text,
    };
    await NetworkManager.instance
        .getDio()
        .post(Endpoints.forgotPassword, data: request)
        .then((response) async {
      if (response.data['success'] == true) {
        AppSnackbar.showSnackbar(
            "Message", response.data['message'], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
        Get.to(()=> SignInScreen());
      } else {
        AppSnackbar.showSnackbar(
            "Error", '${response.data['message']}', AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    }).onError((dio.DioError error, stackTrace) async {
      AppSnackbar.showSnackbar(
          "Error", '${error.response?.data['message']}', AlertType.error);
    });
    update();
  }

}
