import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class CycleSuccessScreen extends StatelessWidget {
  const CycleSuccessScreen({Key? key}) : super(key: key);

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
                  top: Get.height*0.04,
                  left: Get.width*0.07,
                  child: Image.asset('assets/images/Saly-3233.png')),
              Positioned(
                  top: Get.height*0.05,
                  left: Get.width*0.87,
                  child: Image.asset('assets/images/vector2.png')),
              Padding(
                padding:  EdgeInsets.only(top: Get.height*0.52),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width*0.7,
                          child: Text('Your cycle has been created successfully',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.white),),
                        ),
                        SizedBox(height: Get.height*0.02,),
                        SizedBox(
                          width: Get.width*0.6,
                          child: Text('you can now topup your account to start accomplishing the goals you set out for yourself',
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            strutStyle: StrutStyle(
                                height: 1.4
                            ),
                            style: TextStyle(color: AppColors.fadegrey,fontWeight: FontWeight.w400, fontSize: 14),),
                        ),
                        SizedBox(height: Get.height*0.04,),
                        AppButton(
                            buttonName: AppStrings.topup,
                            onTap: (){
                              //Get.to(()=>TopUpChallengeScreen());
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
                        AppButton(
                            buttonName: AppStrings.cyclesummery,
                            onTap: (){
                              //Get.to(()=>SaveChallengeSuccessScreen());
                            },
                            isIconShow: false,
                            height: Get.height*0.071,
                            fontSize: 18,
                            fontweight: FontWeight.w600,
                            width: Get.width* 0.895,
                            backgroundColor: AppColors.backgroundblue,
                            borderColor: BorderSide(width: 1.0, color: AppColors.white,),
                            //iconColor: AppColors.bluishBlack,
                            textColor: AppColors.white),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
