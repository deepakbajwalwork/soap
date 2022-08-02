import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/views/planname_screen.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class SavingOnboardScreen extends StatelessWidget {
  const SavingOnboardScreen({Key? key}) : super(key: key);

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
                  top: Get.height*0.03,
                  left: Get.width*0.23,
                  child: Image.asset('assets/images/Saly-1.png')),
              Positioned(
                  top: Get.height*0.05,
                  left: Get.width*0.87,
                  child: Image.asset('assets/images/vector2.png')),
              Padding(
                padding:  EdgeInsets.only(top: Get.height*0.43,left: Get.width*0.06),
                child: SizedBox(
                  width: Get.width*0.999,
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height*0.065,),
                      SizedBox(
                        width: Get.width*0.8,
                        child: Text('Capture your motivation',
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: AppColors.white),),
                      ),
                      SizedBox(height: Get.height*0.03,),
                      SizedBox(
                        width: Get.width*0.68,
                        child: Text('In the next screens you will be prompted to share a picture and/or Video and a letter to yourself to serve as your motivation to complete your cycle or congratulate yourself unsucessful completion',
                          maxLines: 5,
                          strutStyle: StrutStyle(
                              height: 1.2
                          ),
                          style: TextStyle(color: AppColors.fadegrey,fontWeight: FontWeight.w400, fontSize: 14),),
                      ),
                      SizedBox(height: Get.height*0.04,),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: Get.height*0.76,
                  left: Get.width*0.84,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=> PlanNameScreen());
                    },
                      child: Image.asset('assets/images/bx-chevron-right-circle 1.png')))
            ],
          ),
        )
    );
  }
}
