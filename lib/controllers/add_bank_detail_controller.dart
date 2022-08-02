import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:souapp/helpers/end_points.dart';
import 'package:souapp/helpers/network_manager.dart';
import 'package:souapp/utils/app_snackbar.dart';
import 'package:souapp/views/bankinfosignup_screen.dart';
import 'package:souapp/views/verification_screen.dart';

class AddBankController extends GetxController {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

  RefreshController refreshController =
  RefreshController(initialRefresh: false);
  RxBool allSet = false.obs;

  // add Bank API
  Future addBank({required refresh}) async {
    var request = {
      "bank_name": bankNameController.text,
      "holder_name": accountHolderNameController.text,
      "account_number": accountNumberController.text
    };
    await NetworkManager.instance
        .getDio()
        .post(Endpoints.addBank, data: request)
        .then((response) async {
      if (response.data['success'] == true) {
        allSet.value = true;
        AppSnackbar.showSnackbar(
            "Message", response.data['message'], AlertType.success,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
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
