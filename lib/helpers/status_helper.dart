import 'package:get_storage/get_storage.dart';

class StatusHelper {
  void setLoginStatus(bool status) {
    GetStorage().write('Login Status', status);
  }

  bool get getLoginStatus {
    if (GetStorage().read('Login Status') == null) {
      return false;
    } else {
      return GetStorage().read('Login Status');
    }
  }
}
