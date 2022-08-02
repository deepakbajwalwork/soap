import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/views/vacationresourcesscreen.dart';

import '../utils/appcolors_theme.dart';

class AvailableResourcesScreen extends StatelessWidget {
  AvailableResourcesScreen({Key? key}) : super(key: key);
  final List<String> entries = <String>
  ['assets/images/Rectgle 27.png',
    'assets/images/Rectang 27 (1).png',
    'assets/images/Rectangl 27 (2).png',
    'assets/images/Rtangle 27 (3).png',
    'assets/images/Rtangle 27 (3).png',
    'assets/images/Rectangle 27 (4).png'];
  final List<String> data = <String>['Travel', 'Housing', 'Vacation',"Housing",'Vacation','Vacation'];

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
                    icon: Icon(Icons.arrow_back, color: AppColors.white,)),
              ),
              Positioned(
                left: Get.width*0.11,
                top: Get.height*0.02,
                child: Container(
                  height: Get.height*0.06,
                  width: Get.width*0.77,
                  padding: EdgeInsets.only(left: Get.width*0.02),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:  BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                     // contentPadding: EdgeInsets.all(20),
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search),
                      //fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
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
                  decoration: BoxDecoration(
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
                        Text('Available Resources ',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textblue),),
                        SizedBox(height: Get.height*0.03,),
                        SizedBox(
                          height: Get.height*0.738,
                          child: ListView.separated(
                            //padding: const EdgeInsets.all(8),
                              itemCount: entries.length,
                              scrollDirection: Axis.vertical,
                              separatorBuilder: (BuildContext context, int index) => SizedBox(height: Get.height*0.03,),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: (){
                                   Get.to(()=> VacationResourcesScreen());
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
                                                  Text('${data[index]}',
                                                    style: TextStyle(color: AppColors.black,fontWeight: FontWeight.w600, fontSize: 13),),
                                                  IconButton(
                                                      onPressed: (){},
                                                      icon: Icon(Icons.arrow_forward,size: 18,color: AppColors.textblue,))
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height*0.066,
                                              width: Get.width*0.45,
                                              child: Text('Find travel agency recommended for all trips.',
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
