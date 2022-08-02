import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:souapp/views/summery_screen.dart';

import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';
import '../utils/app_button.dart';

class StartDateScreen extends StatelessWidget {
  const StartDateScreen({Key? key}) : super(key: key);

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
                  top: Get.height*0.08,
                  left: Get.width*0.2,
                  child: Image.asset('assets/images/Saly-42.png')),
              Positioned(
                  top: Get.height*0.05,
                  left: Get.width*0.87,
                  child: Image.asset('assets/images/vector2.png')),
              Padding(
                padding:  EdgeInsets.only(top: Get.height*0.43),
                child: Container(
                  height: Get.height*0.75,
                  width: Get.width*0.999,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width*0.04, right: Get.width*0.04),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height*0.027,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Set Duration',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.textblue),),
                              Text('1/3',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.textblue),)
                            ],
                          ),
                          CalendarCarousel(
                            headerMargin: const EdgeInsets.all(1.0),
                            onCalendarChanged: (val) {
                              //calenderController.getFilter(month: val);
                            },
                            daysHaveCircularBorder: false,

                            headerTextStyle: const TextStyle(
                                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                            iconColor: Colors.pink,
                            todayTextStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            todayButtonColor: Colors.blue,
                            weekendTextStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            weekdayTextStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            thisMonthDayBorderColor: Colors.grey,
                            customDayBuilder: (
                                /// you can provide your own build function to make custom day containers
                                bool isSelectable,
                                int index,
                                bool isSelectedDay,
                                bool isToday,
                                bool isPrevMonthDay,
                                TextStyle textStyle,
                                bool isNextMonthDay,
                                bool isThisMonthDay,
                                DateTime day,
                                ) {
                            },
                            weekFormat: false,
                            //markedDatesMap: _markedDateMap,
                            height: Get.height * 0.4,
                            //selectedDateTime: _currentDate,
                            //daysHaveCircularBorder: false,
                            selectedDayBorderColor: Colors.yellow,
                            //selectedDayButtonColor: Colors.yellow,
                            //selectedDayTextStyle: const TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: Get.height*0.02,),
                          AppButton(
                              buttonName: AppStrings.next,
                              onTap: (){
                                Get.to(()=>SummeryScreen());
                              },
                              isIconShow: false,
                              height: Get.height*0.071,
                              fontSize: 18,
                              fontweight: FontWeight.w600,
                              width: Get.width* 0.93,
                              backgroundColor: AppColors.orange,
                              //iconColor: AppColors.bluishBlack,
                              textColor: Color(0xffFFFFFF)),

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
