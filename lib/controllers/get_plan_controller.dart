import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart' as dio;
import 'package:souapp/helpers/end_points.dart';
import 'package:souapp/helpers/network_manager.dart';
import 'package:souapp/models/plans_model.dart';
import 'package:souapp/utils/app_snackbar.dart';
import 'package:souapp/utils/appstrings.dart';

class GetPlanController extends GetxController {
  String randomCycle = "Random cycle";
  String fixedCycle = "Fixed cycle";

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  TextEditingController nameController = TextEditingController();
  TextEditingController letterController = TextEditingController();
  TextEditingController prefredAmount = TextEditingController();

  RxString _selectedDate = "".obs;
  String get getSelectedDate => this._selectedDate.value;
  set setSelectedDate(DateTime datas) {
    this._selectedDate.value = datas.toIso8601String();
  }

  RxString _cycleType = "Random cycle".obs;
  String get getCycleType => this._cycleType.value;
  set setCycleType(String datas) {
    this._cycleType.value = datas;
  }

  var _plansList = PlansModel().obs;
  PlansModel get getPlansList => _plansList.value;
  set setPlansList(PlansModel value) => _plansList.value = value;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getPlan(refresh: false);
  }

  // Get Plan API
  Future getPlan({required refresh}) async {
    // print(NetworkManager.instance.getDio().get(Endpoints.getPlan));
    // print(response.data.toString());

    Dio _dio = Dio();

    // print(response.data.toString());
    // AppSnackbar.showSnackbar(
    //     "Message", response.data['message'], AlertType.success,
    //     position: SnackPosition.TOP, duration: const Duration(seconds: 2));

    try {
      var response = await _dio.get(
        "https://sou.dc2ws002.zsoftware.tech/api/get-plans",
        options: Options(
          headers: {
            "Accept": "application/json",
            "authorization": "Bearer ${GetStorage().read(AppStrings.token)}"
          },
        ),
      );

      setPlansList = PlansModel.fromJson(response.data);
    } catch (e) {
      AppSnackbar.showSnackbar("Error", e.toString(), AlertType.error,
          position: SnackPosition.TOP, duration: const Duration(seconds: 2));
    }

    update();
  }
}
