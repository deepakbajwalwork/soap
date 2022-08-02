import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/views/legalinfosignup_screen.dart';

import '../controllers/otp_verification_controller.dart';
import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class VerificationScreen extends StatelessWidget {
 final String? email;
 final String? password;
  VerificationScreen({Key? key, this.email, this.password}) : super(key: key);
   final OtpVerificationController otpVerificationController =
   Get.put(OtpVerificationController(), permanent: true);
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundblue,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: Get.width*0.045,right: Get.width*0.04 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height*0.06,),
                Image.asset('assets/images/logo.png'),
                SizedBox(height: Get.height*0.06,),
                Center(
                  child: SizedBox(
                    height: Get.height*0.051,
                    width: Get.width*0.5,
                    child: const Text("A code has been sent to Your\n registered email",
                      maxLines: 2,
                      strutStyle: StrutStyle(
                        height: 1.5,
                      ),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.verifygrey),),
                  ),
                ),
                SizedBox(height: Get.height*0.06,),
                Form(
                  key: formKey,
                    child: const OtpForm()),
                SizedBox(height: Get.height*0.05,),
                Center(
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        otpVerificationController.resendOtp(refresh: true, email: email!, password: password!);
                      }
                    },
                    child: Text('Resend code (0:30)',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.darkblue,
                      decoration: TextDecoration.underline,),),

                  ),
                ),
                SizedBox(height: Get.height*0.06,),
                AppButton(
                    buttonName: AppStrings.proceed,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        otpVerificationController.verifyOtp(refresh: true, email: email!, password: password!);
                      }

                      showModalBottomSheet<void>(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return Container(
                            height: Get.height*0.65,
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(40.0),
                                    topRight: const Radius.circular(40.0)),
                              color: AppColors.white
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text('Submitted successfully',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xff000000)),),
                                  Image.asset('assets/images/Succes.png'),
                                  SizedBox(height: Get.height*0.01,),
                                  Text('Hello! Queen Vee',
                                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400, color: Color(0xff000000)),),
                                  SizedBox(height: Get.height*0.02,),
                                  Text('Welcome to Sou',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xff000000)),),
                                  SizedBox(height: Get.height*0.06,),
                                  AppButton(
                                      buttonName: AppStrings.next,
                                      onTap: (){
                                        Get.to(() => LegalInfoScreen(email: email!, password: password!));
                                      },
                                      isIconShow: false,
                                      height: Get.height*0.071,
                                      fontSize: 18,
                                      fontweight: FontWeight.w600,
                                      width: Get.width* 0.895,
                                      backgroundColor: AppColors.orange,
                                      //iconColor: AppColors.bluishBlack,
                                      textColor: Color(0xffFFFFFF))
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    height: Get.height*0.071,
                    fontSize: 18,
                    fontweight: FontWeight.w600,
                    isIconShow: false,
                    width: Get.width* 0.895,
                    backgroundColor: AppColors.orange,
                    //iconColor: AppColors.bluishBlack,
                    textColor: Color(0xffFFFFFF)
                  //AppColors.bluishBlack,
                ),
                SizedBox(height: Get.height*0.025,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {

  FocusNode pin2FocusNode = FocusNode();
  FocusNode pin3FocusNode = FocusNode();
  FocusNode pin4FocusNode = FocusNode();
  final OtpVerificationController otpVerificationController =
  Get.put(OtpVerificationController(), permanent: true);
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextfield({required String value, required FocusNode focusNode}){
    if(value.length == 1){
      focusNode.requestFocus();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Get.width*0.14,
          height: Get.height*0.11,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:Border.all(color: Color(0xffDDDDDD))
          ),
          child: TextFormField(
            autofocus: true,
            style: TextStyle(fontSize: 30, color: AppColors.grey),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: otpVerificationController.otp1Controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value){
              nextfield(value: value, focusNode: pin2FocusNode);
            },
          ),
        ),
        Container(
          width: Get.width*0.14,
          height: Get.height*0.11,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:Border.all(color: Color(0xffDDDDDD))
          ),
          child: TextFormField(
            style: TextStyle(fontSize: 30, color: AppColors.grey),
            focusNode: pin2FocusNode,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: otpVerificationController.otp2Controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(20),
              //   borderSide: BorderSide(color: Color(0xffDDDDDD))
              // )
            ),
            onChanged: (value){
              nextfield(value: value, focusNode: pin3FocusNode);
            },
          ),
        ),
        Container(
          width: Get.width*0.14,
          height: Get.height*0.11,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:Border.all(color: Color(0xffDDDDDD))
          ),
          child: TextFormField(
            style: TextStyle(fontSize: 30, color: AppColors.grey),
            focusNode: pin3FocusNode,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: otpVerificationController.otp3Controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(20),
              //   borderSide: BorderSide(color: Color(0xffDDDDDD))
              // )
            ),
            onChanged: (value){
              nextfield(value: value, focusNode: pin4FocusNode);
            },
          ),
        ),
        Container(
          width: Get.width*0.14,
          height: Get.height*0.11,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:Border.all(color: Color(0xffDDDDDD))
          ),
          child: TextFormField(
            style: TextStyle(fontSize: 30, color: AppColors.textblue),
            focusNode: pin4FocusNode,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: otpVerificationController.otp4Controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(20),
              //   borderSide: BorderSide(color: Color(0xffDDDDDD))
              // )
            ),
            onChanged: (value){
              pin4FocusNode.unfocus();
            },
          ),
        ),
      ],
    );
  }
}
