import 'package:get/get.dart';
import 'package:souapp/controllers/sign_up_controller.dart';

import 'package:souapp/helpers/status_helper.dart';

class AppManager {
  static StatusHelper statusHelper = StatusHelper();

  static SignUpController signUpController = Get.find<SignUpController>();
  // static SignInController signInController = Get.find<SignInController>();
  // static ForgotPasswordController forgotPasswordController =
  // Get.find<ForgotPasswordController>();
  // static EditProfileController editProfileController =
  // Get.find<EditProfileController>();
}
