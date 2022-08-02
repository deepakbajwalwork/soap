import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:souapp/helpers/end_points.dart';
import 'package:souapp/helpers/network_manager.dart';
import 'package:souapp/utils/app_snackbar.dart';
import 'package:souapp/views/bankinfosignup_screen.dart';
import 'package:souapp/views/verification_screen.dart';

class legalInformationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController securityNoController = TextEditingController();

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  // using same register API for legal information
  Future legalInformation({required refresh,required String email, required String password }) async {
    var request = {
      "email": email,
      "password": password,
      "name":nameController.text,
      "dob":dobController.text,
      "security_number": securityNoController.text
    };
    await NetworkManager.instance
        .getDio()
        .post(Endpoints.register, data: request)
        .then((response) async {
      if (response.data['success'] == true) {
        AppSnackbar.showSnackbar(
            "Message", response.data['message'], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
        Get.to(()=> BankInfoScreen());
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
