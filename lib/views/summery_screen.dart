import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/views/cyclesuccess_screen.dart';
import 'package:souapp/views/savechallengesuccess_screen.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class SummeryScreen extends StatelessWidget {
  const SummeryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundblue,
          body: Stack(
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_back, color: AppColors.white,)),
              Positioned(
                  top: Get.height*0.08,
                  left: Get.width*0.89,
                  child: Image.asset('assets/images/vector2.png',fit: BoxFit.fill,)),
              Padding(
                padding: EdgeInsets.only(top: Get.height*0.12),
                child: Container(
                  height: Get.height*0.9,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:  EdgeInsets.only(left: Get.width*0.033, right: Get.width*0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height*0.02,),
                          Text('50 envelopes',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: AppColors.textblue),),
                          SizedBox(height: Get.height*0.01,),
                          Text('Saving plan for rent'),
                          SizedBox(height: Get.height*0.03,),
                          Container(
                            height: Get.height*0.4,
                            width: Get.width*0.92,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.verifygrey,width: 2.0),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Review  Plan',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.black),),
                                SizedBox(height: Get.height*0.016,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Base Savings Amount',
                                    style: TextStyle(color: AppColors.textblue, fontSize: 12, fontWeight: FontWeight.w300),),
                                    Text('100',
                                      style: TextStyle(color: AppColors.verifygrey, fontSize: 12, fontWeight: FontWeight.w500),)
                                  ],
                                ),
                                SizedBox(height: Get.height*0.002,),
                                Divider(
                                  color: AppColors.backgroundblue,
                                  thickness: 1.5,
                                ),
                                SizedBox(height: Get.height*0.004,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Incremental savings plan',
                                      style: TextStyle(color: AppColors.textblue, fontSize: 12, fontWeight: FontWeight.w300),),
                                    Text('Disabled',
                                      style: TextStyle(color: AppColors.verifygrey, fontSize: 12, fontWeight: FontWeight.w500),)
                                  ],
                                ),
                                SizedBox(height: Get.height*0.004,),
                                Divider(
                                  color: AppColors.backgroundblue,
                                  thickness: 1.5,
                                ),
                                SizedBox(height: Get.height*0.004,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Savings Frequency',
                                      style: TextStyle(color: AppColors.textblue, fontSize: 12, fontWeight: FontWeight.w300),),
                                    Text('Bi Weekly',
                                      style: TextStyle(color: AppColors.verifygrey, fontSize: 12, fontWeight: FontWeight.w500),)
                                  ],
                                ),
                                SizedBox(height: Get.height*0.004,),
                                Divider(
                                  color: AppColors.backgroundblue,
                                  thickness: 1.5,
                                ),
                                SizedBox(height: Get.height*0.004,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Number of envelopes',
                                      style: TextStyle(color: AppColors.textblue, fontSize: 12, fontWeight: FontWeight.w300),),
                                    Text('100',
                                      style: TextStyle(color: AppColors.verifygrey, fontSize: 12, fontWeight: FontWeight.w500),)
                                  ],
                                ),
                                SizedBox(height: Get.height*0.004,),

                              ],
                            ),
                          ),
                          SizedBox(height: Get.height*0.05,),
                          AppButton(
                              buttonName: AppStrings.saveplan,
                              onTap: (){
                                Get.off(()=>CycleSuccessScreen());
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
                              buttonName: AppStrings.editplan,
                              onTap: (){
                                Get.to(()=>SaveChallengeSuccessScreen());
                              },
                              isIconShow: false,
                              height: Get.height*0.071,
                              fontSize: 18,
                              fontweight: FontWeight.w600,
                              width: Get.width* 0.895,
                              backgroundColor: AppColors.white,
                              borderColor: BorderSide(width: 1.0, color: AppColors.orange,),
                              //iconColor: AppColors.bluishBlack,
                              textColor: AppColors.orange),
                          SizedBox(height: Get.height*0.04,),
                        ],
                      ),
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
