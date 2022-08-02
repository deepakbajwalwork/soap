import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/controllers/legal_information.controller.dart';
import 'package:souapp/views/bankinfosignup_screen.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';
import '../utils/apptext_field.dart';

class LegalInfoScreen extends StatelessWidget {
  String email;
  String password;
  LegalInfoScreen({Key? key, required this.email, required this.password}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final legalInformationController legalController =
  Get.put(legalInformationController(), permanent: true);
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
                  SizedBox(height: Get.height*0.022,),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width*0.04,top: Get.height*0.04),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(height: Get.height*0.022,),
                  Container(
                    height: Get.height*0.75,
                    width: Get.width*0.999,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: Get.width*0.04,top: Get.height*0.02,right: Get.width*0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height*0.008,),
                          Text('Legal Information',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),),
                          SizedBox(height: Get.height*0.008,),
                          Text('Tell us about yourself',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textblue),),
                          SizedBox(height: Get.height*0.025,),
                          AppTextField(
                            controller: legalController.nameController,
                            title: Text(AppStrings.fullname,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black),),
                            hintText: AppStrings.fullname,
                            validatorName: (value) {
                              if (value?.trim().isEmpty ?? true) {
                                return AppStrings.enterName;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Get.height*0.035),
                          AppTextField(

                            controller: legalController.dobController,
                            title: const Text(AppStrings.dateofbirth,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black),),
                            hintText: 'yyyy-mm-dd',
                            validatorName: (value) {
                              if (value?.trim().isEmpty ?? true) {
                                return AppStrings.enterDob;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Get.height*0.035),
                          AppTextField(
                            controller: legalController.securityNoController,

                            title: Text(AppStrings.socialno,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black),),
                            hintText: AppStrings.socialno,
                            validatorName: (value) {
                              if (value!.length !=9 ? true: false) {
                                return AppStrings.enterSecurity;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Get.height*0.12),

                          AppButton(
                            onTap: (){
                              if (formKey.currentState!.validate()) {
                                print("Checking information");
                                legalController.legalInformation(refresh: true, email:  email, password: password);
                              }

                            },
                            buttonName: AppStrings.next,
                            isIconShow: false,
                            width: Get.width*0.89,
                            height: Get.height*0.07,
                            fontSize: 18,
                            fontweight: FontWeight.w600,
                            backgroundColor: AppColors.orange,

                          ),
                          SizedBox(height: Get.height*0.04,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
