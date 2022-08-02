import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/controllers/sign-in_controller.dart';
import 'package:souapp/utils/appstrings.dart';
import 'package:souapp/views/forgot_password_screen.dart';
import 'package:souapp/views/signup_screen.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/apptext_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController =
      Get.put(SignInController(), permanent: true);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundblue,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.04, top: Get.height * 0.04),
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.04, top: Get.height * 0.03),
                child: const Text(
                  AppStrings.signin,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: AppColors.lightgrey),
                ),
              ),
              SizedBox(
                height: Get.height * 0.022,
              ),
              Container(
                height: Get.height * 0.62,
                width: Get.width * 0.999,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.04,
                      top: Get.height * 0.03,
                      right: Get.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: Get.height*0.02,),
                      AppTextField(
                        controller: signInController.emailIdController,
                        title: Text(
                          AppStrings.emailaccount,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black),
                        ),
                        hintText: AppStrings.emailaccount,
                        validatorName: AppStrings().validateEmail,
                      ),
                      SizedBox(height: Get.height * 0.035),
                      AppTextField(
                        controller: signInController.passwordController,
                        title: Text(
                          AppStrings.password,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black),
                        ),
                        hintText: AppStrings.password,
                        obscureText: true,
                        validatorName: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return AppStrings.enterPassword;
                          }
                          return null;
                        },
                      ),
                      //SizedBox(height: Get.height*0.01),
                      SizedBox(
                        width: Get.width * 0.89,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Transform.scale(
                                  scale: 0.8,
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.lightblack),
                                )
                              ],
                            ),
                            TextButton(
                              child: Text(
                                AppStrings.forgotpassword,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.lightblack),
                              ),
                              onPressed: () {
                                Get.off(() => ForgotPasswordScreen());
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.08,
                      ),
                      AppButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            signInController.signIn(refresh: true);
                          }
                        },
                        buttonName: AppStrings.signin,
                        isIconShow: false,
                        width: Get.width * 0.89,
                        height: Get.height * 0.07,
                        fontSize: 18,
                        fontweight: FontWeight.w600,
                        backgroundColor: AppColors.orange,
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => SignUpScreen());
                          },
                          child: const Text(
                            'Don’t have an account? Signup',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blue),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xff464646);
    }
    return Color(0xff464646);
  }
}
