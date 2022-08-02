import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/views/savechallengesuccess_screen.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class NoSodaScreen extends StatelessWidget {
  const NoSodaScreen({Key? key}) : super(key: key);

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
                          SizedBox(height: Get.height*0.04),
                          Text('No Soda Challenge',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textblue),),
                          SizedBox(height: Get.height*0.01,),
                          Text('14 days',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: AppColors.textblue)),
                          SizedBox(height: Get.height*0.03,),
                          SizedBox(
                            height: Get.height*0.26,
                              width: Get.width*0.93,
                              child: Image.asset('assets/images/Mask group (2).png',
                              fit: BoxFit.fill,)),
                          SizedBox(height: Get.height*0.02,),
                          SizedBox(
                            width: Get.width*0.7,
                            child: Text('Healthy habits: No Soda, caffeine, Save extra.',
                            maxLines: 2,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black),),
                          ),
                          SizedBox(height: Get.height*0.02,),
                          SizedBox(
                            width: Get.width*0.72,
                            child: Text('Save extra money by avoiding caffeine, soda and other fizzy drink. Add every extra cash to your savings cycle for 2 weeks',
                            maxLines: 3,
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.grey),),
                          ),
                          SizedBox(height: Get.height*0.03,),
                          
                          Text('Benefits',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textblack),),
                          SizedBox(height: Get.height*0.01,),
                          Text('Eat healthier',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.grey),),
                          SizedBox(height: Get.height*0.006,),
                          Text('Save Extra',
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.grey),),
                          SizedBox(height: Get.height*0.006,),
                          Text('Build better habits',
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.grey),),
                          SizedBox(height: Get.height*0.04,),
                          
                          Text('Badges',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textblack),),
                          SizedBox(height: Get.height*0.006,),
                          Text('Badges you’ve earned on achieving milestones',
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: AppColors.grey),),
                          SizedBox(height: Get.height*0.04,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset('assets/images/Gold.png'),
                                  Text('Day 1',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: AppColors.black),)
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset('assets/images/Bronze.png'),
                                  Text('Day 7',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: AppColors.black),)
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset('assets/images/Silver.png'),
                                  Text('Day 14',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: AppColors.black),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height*0.04,),
                          AppButton(
                              buttonName: AppStrings.acceptchallenge,
                              onTap: (){
                                //Get.off(()=>HomeScreen());
                              },
                              isIconShow: false,
                              height: Get.height*0.071,
                              fontSize: 18,
                              fontweight: FontWeight.w600,
                              width: Get.width* 0.895,
                              backgroundColor: AppColors.orange,
                              //iconColor: AppColors.bluishBlack,
                              textColor: Color(0xffFFFFFF)),

                          SizedBox(height: Get.height*0.06,),
                          Text('Progress tracker',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textblack),),
                          SizedBox(height: Get.height*0.006,),
                          Text('See how close you are to acing this challenge!',
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: AppColors.grey),),
                          SizedBox(height: Get.height*0.03,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Day 1',
                              style: TextStyle(color: AppColors.lightblue, fontSize: 12, fontWeight: FontWeight.w600),),
                              Text('Day 14',
                                style: TextStyle(color: AppColors.lightblue, fontSize: 12, fontWeight: FontWeight.w600),),
                            ],
                          ),
                          SizedBox(height: Get.height*0.006,),
                          SizedBox(
                            width: Get.width*0.93,
                              child: Image.asset('assets/images/Group 1192.png',
                              fit: BoxFit.fill,)),
                          SizedBox(height: Get.height*0.04,),
                          Text('Badges',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textblack),),
                          SizedBox(height: Get.height*0.006,),
                          Text('Badges you’ve earned on achieving milestones',
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: AppColors.grey),),
                          SizedBox(height: Get.height*0.04,),
                          Column(
                            children: [
                              Image.asset('assets/images/Gold.png'),
                              Text('Day 1',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: AppColors.black),)
                            ],
                          ),
                          SizedBox(height: Get.height*0.04,),
                          AppButton(
                              buttonName: AppStrings.topup,
                              onTap: (){
                                Get.to(()=>SaveChallengeSuccessScreen());
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
