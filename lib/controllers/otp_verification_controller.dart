import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:souapp/helpers/end_points.dart';
import 'package:souapp/helpers/network_manager.dart';
import 'package:souapp/utils/app_snackbar.dart';
import 'package:souapp/views/legalinfosignup_screen.dart';
import 'package:souapp/views/verification_screen.dart';

class OtpVerificationController extends GetxController {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  // Otp verification API
  Future verifyOtp({required refresh, required String email, required String password}) async {
    var request = {
      "email": email,
      "code": otp1Controller.text.toString() + otp2Controller.text.toString() + otp3Controller.text.toString() + otp4Controller.text.toString(),
    };
    await NetworkManager.instance
        .getDio()
        .post(Endpoints.emailVerification, data: request)
        .then((response) async {
      if (response.data['success'] == true) {
        AppSnackbar.showSnackbar(
            "Message", response.data['message'], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
        // Get.to(() => LegalInfoScreen(email: email, password: password));
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


  // resendOtp API
  Future resendOtp({required refresh, required String email, required String password}) async {
    var request = {
      "email": email,
    };
    await NetworkManager.instance
        .getDio()
        .post(Endpoints.resendOtp, data: request)
        .then((response) async {
      if (response.data['success'] == true) {
        AppSnackbar.showSnackbar(
            "Message", response.data['message'], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
        // Get.to(() => LegalInfoScreen(email: email, password: password));
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
