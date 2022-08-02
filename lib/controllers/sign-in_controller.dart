import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:souapp/utils/app_snackbar.dart';
import 'package:souapp/utils/appstrings.dart';

class SignInController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  // SignIn API
  Future signIn({required refresh}) async {
    var request = {
      "email": emailIdController.text,
      "password": passwordController.text,
    };

    Dio _dio = Dio();

    // print(response.data.toString());
    // AppSnackbar.showSnackbar(
    //     "Message", response.data['message'], AlertType.success,
    //     position: SnackPosition.TOP, duration: const Duration(seconds: 2));

    try {
      var response = await _dio.post(
        "https://sou.dc2ws002.zsoftware.tech/api/login",
        options: Options(
          headers: {
            "Accept": "application/json",
            "authorization": "Bearer ${GetStorage().read(AppStrings.token)}"
          },
        ),
        data: request,
      );
      // print(response.data.toString());
      // print(response.data["token"].toString());

      GetStorage().write(AppStrings.token, response.data['token']);
      // print('read token ==>' + GetStorage().read(AppStrings.token).toString());
      // GetStorage().read(AppStrings.token);
      // Get.to(() => HomeScreen());
    } catch (e) {
      AppSnackbar.showSnackbar("Error", e.toString(), AlertType.error,
          position: SnackPosition.TOP, duration: const Duration(seconds: 2));
    }
    // await NetworkManager.instance
    //     .getDio()
    //     .post(Endpoints.login, data: request)
    //     .then((response) async {
    //   print(response.data.toString());

    //   if (response.data['success'] == true) {
    //     // AppSnackbar.showSnackbar(
    //     //     "Message", response.data['message'], AlertType.success,
    //     //     position: SnackPosition.TOP, duration: const Duration(seconds: 2));

    //     GetStorage().write(AppStrings.token, response.data['token']);
    //     // Get.to(() => HomeScreen());
    //   } else {
    //     AppSnackbar.showSnackbar(
    //         "Error", '${response.data['message']}', AlertType.error,
    //         position: SnackPosition.TOP, duration: const Duration(seconds: 2));
    //   }
    // }).onError((dio.DioError error, stackTrace) async {
    //   AppSnackbar.showSnackbar(
    //       "Error", '${error.response?.data['message']}', AlertType.error);
    // });
    update();
  }
}
