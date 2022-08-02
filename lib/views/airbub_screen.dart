import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class AirBnbScreen extends StatelessWidget {
  const AirBnbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundblue,
          body: Stack(
            children: [
              Positioned(
                top: Get.height*0.017,
                child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.arrow_back, color: AppColors.white,)),
              ),
              Positioned(
                  top: Get.height*0.08,
                  left: Get.width*0.89,
                  child: Image.asset('assets/images/vector2.png',fit: BoxFit.fill,)),
              Padding(
                padding: EdgeInsets.only(top: Get.height*0.12),
                child: Container(
                  height: Get.height*0.9,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.only(left: Get.width*0.033, right: Get.width*0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height*0.03,),
                        const Text('Available Resources ',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textblue),),
                        SizedBox(height: Get.height*0.005,),
                        const Text('Resources > vacation>  AirBnB',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: AppColors.black)),
                        SizedBox(height: Get.height*0.03,),
                        SizedBox(
                          width: Get.width*0.93,
                            child: Image.asset('assets/images/airbnb.png',
                            fit: BoxFit.fill,)),
                        SizedBox(height: Get.height*0.032,),
                        SizedBox(
                          width: Get.width*0.88,
                          child: const Text('Airbnb: Vacation Rentals, Cabins, Beach Houses and more',
                          maxLines: 2,
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600, color: AppColors.textblack),),
                        ),
                        SizedBox(height: Get.height*0.032,),
                        SizedBox(
                          width: Get.width*0.88,
                          child: const Text('Find vacation rentals, cabins, beach houses, unique homes and experiences around the world - all made possible by hosts on Airbnb.',
                              maxLines: 3,
                              strutStyle: StrutStyle(
                                height: 1.3
                              ),
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.grey,letterSpacing: 1.0),),
                        ),
                        SizedBox(height: Get.height*0.11,),
                        AppButton(
                            buttonName: AppStrings.visitwebsite,
                            onTap: (){
                              //Get.off(()=>HomeScreen());
                            },
                            isIconShow: false,
                            height: Get.height*0.071,
                            fontSize: 18,
                            fontweight: FontWeight.w600,
                            width: Get.width* 0.95,
                            backgroundColor: AppColors.orange,
                            //iconColor: AppColors.bluishBlack,
                            textColor: const Color(0xffFFFFFF))
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
