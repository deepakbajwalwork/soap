import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/appcolors_theme.dart';

class CyclesScreen extends StatelessWidget {
  CyclesScreen({Key? key}) : super(key: key);
  final List<String> entries = <String>
  ['assets/images/online-study.png',
    'assets/images/graduation-hat.png',
    'assets/images/bus.png',
  'assets/images/color-palette.png'];
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
                          Text('My savings Cycles',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textblue),),
                          SizedBox(height: Get.height*0.03,),
                          SizedBox(
                            height: Get.height*0.7,
                            child: ListView.separated(
                                padding: const EdgeInsets.all(8),
                                itemCount: entries.length,
                                separatorBuilder: (BuildContext context, int index) => SizedBox(height: Get.height*0.03,),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: AppColors.filledcolor,
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.textblue),
                                            color: AppColors.orange
                                          ),
                                            child: Image.asset('${entries[index]}')),
                                        Text('Buy New Gadgets',
                                        style: TextStyle(color: AppColors.black,fontWeight: FontWeight.w600, fontSize: 14),),
                                        IconButton(
                                            onPressed: (){},
                                            icon: Icon(Icons.arrow_forward,size: 18,))
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
