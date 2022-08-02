import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/views/nosoda_screen.dart';

import '../utils/appcolors_theme.dart';

class ResourcesScreen extends StatelessWidget {
  ResourcesScreen({Key? key}) : super(key: key);

  final List<String> entries = <String>
  ['assets/images/Rectangle 27.png',
    'assets/images/Rectangle 27 (3).png',
    'assets/images/Rectangle 27 (1).png',
    'assets/images/Rectangle 27 (2).png'];

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
                          SizedBox(height: Get.height*0.03,),
                          Text('Saving challenges',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textblue),),
                          SizedBox(height: Get.height*0.01,),
                          Text('Select a savings challenge to embark on',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: AppColors.black)),
                          SizedBox(height: Get.height*0.03,),
                          SizedBox(
                            height: Get.height*0.6,
                            child: ListView.separated(
                                //padding: const EdgeInsets.all(8),
                                itemCount: entries.length,
                                separatorBuilder: (BuildContext context, int index) => SizedBox(height: Get.height*0.03,),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: (){
                                      Get.to(()=> NoSodaScreen());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          color: AppColors.lightpink,
                                          borderRadius: BorderRadius.circular(6)
                                      ),
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: AppColors.textblue),
                                                  color: AppColors.orange
                                              ),
                                              child: Image.asset('${entries[index]}')),
                                          SizedBox(width: Get.width*0.012,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Get.width*0.58,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('Coupon week',
                                                      style: TextStyle(color: AppColors.black,fontWeight: FontWeight.w600, fontSize: 13),),
                                                    IconButton(
                                                        onPressed: (){},
                                                        icon: Icon(Icons.arrow_forward,size: 18,))
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: Get.height*0.066,
                                                width: Get.width*0.45,
                                                child: Text('Use coupons and save every extra dollar as a tip to yourself',
                                                maxLines: 2,
                                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: AppColors.grey),),
                                              )
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ),

                          SizedBox(height: Get.height*0.02,),
                          Text('Ongoing challenges',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textblue),),
                          SizedBox(height: Get.height*0.01,),
                          Text('See challenges your are participating in',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: AppColors.textblue)),
                          SizedBox(height: Get.height*0.03,),
                          SizedBox(
                            height: Get.height*0.6,
                            child: ListView.separated(
                              //padding: const EdgeInsets.all(8),
                                itemCount: entries.length,
                                separatorBuilder: (BuildContext context, int index) => SizedBox(height: Get.height*0.03,),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        color: AppColors.lightpink,
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(color: AppColors.textblue),
                                                color: AppColors.orange
                                            ),
                                            child: Image.asset('${entries[index]}')),
                                        SizedBox(width: Get.width*0.012,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Get.width*0.58,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Coupon week',
                                                    style: TextStyle(color: AppColors.black,fontWeight: FontWeight.w600, fontSize: 13),),
                                                  IconButton(
                                                      onPressed: (){},
                                                      icon: Icon(Icons.arrow_forward,size: 18,))
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height*0.066,
                                              width: Get.width*0.45,
                                              child: Text('Use coupons and save every extra dollar as a tip to yourself',
                                                maxLines: 2,
                                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: AppColors.grey),),
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                  );
                                }
                            ),
                          )
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
