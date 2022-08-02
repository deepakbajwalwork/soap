import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/controllers/add_bank_detail_controller.dart';

import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';
import '../utils/apptext_field.dart';
import '../utils/app_button.dart';
import 'home_screen.dart';

class BankInfoScreen extends StatelessWidget {
  BankInfoScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AddBankController addBankController =
      Get.put(AddBankController(), permanent: true);

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
              SizedBox(
                height: Get.height * 0.022,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.04, top: Get.height * 0.04),
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(
                height: Get.height * 0.022,
              ),
              Container(
                height: Get.height * 0.75,
                width: Get.width * 0.999,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.04,
                      top: Get.height * 0.02,
                      right: Get.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.008,
                      ),
                      Text(
                        'Bank Information',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black),
                      ),
                      SizedBox(
                        height: Get.height * 0.008,
                      ),
                      Text(
                        'FInd your bank to connect to SOU',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textblue),
                      ),
                      SizedBox(
                        height: Get.height * 0.025,
                      ),
                      AppTextField(
                        controller: addBankController.bankNameController,
                        title: Text(
                          AppStrings.bank,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black),
                        ),
                        validatorName: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return AppStrings.enterBankName;
                          }
                          return null;
                        },
                        hintText: AppStrings.bankName,
                      ),
                      SizedBox(height: Get.height * 0.035),
                      AppTextField(
                        controller:
                            addBankController.accountHolderNameController,
                        title: Text(
                          AppStrings.accountname,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black),
                        ),
                        validatorName: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return AppStrings.enterAccountHolderName;
                          }
                          return null;
                        },
                        hintText: AppStrings.accountHolderName,
                      ),
                      SizedBox(height: Get.height * 0.035),
                      AppTextField(
                        controller: addBankController.accountNumberController,
                        title: Text(
                          AppStrings.accountnumber,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black),
                        ),
                        validatorName: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return AppStrings.enterAccountNumber;
                          }
                          return null;
                        },
                        hintText: AppStrings.accountnumber,
                      ),
                      SizedBox(height: Get.height * 0.12),
                      AppButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            addBankController.addBank(refresh: true).then(
                                (value) => addBankController.allSet.value ==
                                        true
                                    ? showModalBottomSheet<void>(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        backgroundColor: Colors.transparent,
                                        builder: (BuildContext context) {
                                          return Container(
                                            height: Get.height * 0.65,
                                            decoration: BoxDecoration(
                                                borderRadius: new BorderRadius
                                                        .only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            40.0),
                                                    topRight:
                                                        const Radius.circular(
                                                            40.0)),
                                                color: AppColors.white),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    'Submitted successfully',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff000000)),
                                                  ),
                                                  Image.asset(
                                                      'assets/images/Succes.png'),
                                                  SizedBox(
                                                    height: Get.height * 0.01,
                                                  ),
                                                  Text(
                                                    'Hello! Queen Vee',
                                                    style: TextStyle(
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xff000000)),
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.02,
                                                  ),
                                                  Text(
                                                    'You’re all set up!',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff000000)),
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.06,
                                                  ),
                                                  AppButton(
                                                      buttonName:
                                                          AppStrings.next,
                                                      onTap: () {
                                                        Get.off(
                                                            () => HomeScreen());
                                                      },
                                                      isIconShow: false,
                                                      height:
                                                          Get.height * 0.071,
                                                      fontSize: 18,
                                                      fontweight:
                                                          FontWeight.w600,
                                                      width: Get.width * 0.895,
                                                      backgroundColor:
                                                          AppColors.orange,
                                                      //iconColor: AppColors.bluishBlack,
                                                      textColor:
                                                          Color(0xffFFFFFF))
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : null);
                          }
                        },
                        buttonName: AppStrings.next,
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
}
