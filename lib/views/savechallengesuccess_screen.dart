import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/utils/appcolors_theme.dart';

import '../utils/app_button.dart';
import '../utils/appstrings.dart';
import 'topupchallenge_screen.dart';

class SaveChallengeSuccessScreen extends StatelessWidget {
  const SaveChallengeSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundblue,
          body: Stack(
            children: [
              IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.arrow_back,color: AppColors.white,)),
              Positioned(
                  top: Get.height*0.1,
                  left: Get.width*0.23,
                  child: Image.asset('assets/images/Saly-32.png')),
              Positioned(
                top: Get.height*0.05,
                  left: Get.width*0.87,
                  child: Image.asset('assets/images/vector2.png')),
              Padding(
                padding:  EdgeInsets.only(top: Get.height*0.43),
                child: Center(
                  child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width*0.7,
                        child: Text('Your Challenge has been created successfully',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.white),),
                      ),
                      SizedBox(height: Get.height*0.02,),
                      SizedBox(
                        width: Get.width*0.65,
                        child: Text('Your challenge would be added to your current saving cycle and would affect your total expected withdrawal amount',
                        maxLines: 4,
                          strutStyle: StrutStyle(
                            height: 1.4
                          ),
                          style: TextStyle(color: AppColors.fadegrey,fontWeight: FontWeight.w400, fontSize: 14),),
                      ),
                      SizedBox(height: Get.height*0.04,),
                      AppButton(
                          buttonName: AppStrings.topup,
                          onTap: (){
                            Get.to(()=>TopUpChallengeScreen());
                          },
                          isIconShow: false,
                          height: Get.height*0.071,
                          fontSize: 18,
                          fontweight: FontWeight.w600,
                          width: Get.width* 0.895,
                          backgroundColor: AppColors.orange,
                          //iconColor: AppColors.bluishBlack,
                          textColor: Color(0xffFFFFFF)),

                      SizedBox(height: Get.height*0.04,),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: Get.height*0.071,
                          width: Get.width* 0.895,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(AppStrings.home,
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.white),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
