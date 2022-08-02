import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:souapp/helpers/end_points.dart';
import 'package:souapp/helpers/network_manager.dart';
import 'package:souapp/utils/app_snackbar.dart';

class EditPlanController extends GetxController {
  RefreshController refreshController = RefreshController(initialRefresh: false);

  // Edit Plan API
  Future editPlan({required refresh}) async {
    await NetworkManager.instance.getDio().get(Endpoints.editPlan).then((response) async {
      if (response.data['success'] == true) {
        // AppSnackbar.showSnackbar(
        //     "Message", response.data['message'], AlertType.success,
        //     position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      } else {
        AppSnackbar.showSnackbar("Error", '${response.data['message']}', AlertType.error,
            position: SnackPosition.TOP, duration: const Duration(seconds: 2));
      }
    }).onError((dio.DioError error, stackTrace) async {
      AppSnackbar.showSnackbar("Error", '${error.response?.data['message']}', AlertType.error);
    });
    update();
  }
}
