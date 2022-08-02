import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/views/letter_screen.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class MotivationScreen extends StatelessWidget {
  const MotivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundblue,
      body: Stack(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              )),
          Positioned(
              top: Get.height * 0.01,
              left: Get.width * 0.22,
              child: Image.asset('assets/images/Empty-Files.png')),
          Positioned(
              top: Get.height * 0.05,
              left: Get.width * 0.87,
              child: Image.asset('assets/images/vector2.png')),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.43),
            child: Container(
              height: Get.height * 0.75,
              width: Get.width * 0.999,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.04, right: Get.width * 0.04),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.027,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add visual motivation',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.textblue),
                          ),
                          Text(
                            '1/2',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColors.textblue),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      ListTile(
                        leading: Image.asset(
                            'assets/images/File_Formats_(189) 1.png'),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Family christmas'),
                            Text('60%'),
                          ],
                        ),
                        subtitle: SizedBox(
                            width: Get.width * 0.9,
                            child: Image.asset(
                              'assets/images/Group 61.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        height: Get.height * 0.004,
                      ),
                      ListTile(
                        leading: Image.asset(
                            'assets/images/File_Formats_(189) 1.png'),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Family christmas'),
                            Text('60%'),
                          ],
                        ),
                        subtitle: SizedBox(
                            width: Get.width * 0.9,
                            child: Image.asset(
                              'assets/images/Group 61.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        height: Get.height * 0.004,
                      ),
                      ListTile(
                        leading: Image.asset(
                            'assets/images/File_Formats_(189) 1.png'),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Family christmas'),
                            Text('60%'),
                          ],
                        ),
                        subtitle: SizedBox(
                            width: Get.width * 0.9,
                            child: Image.asset(
                              'assets/images/Group 61.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        height: Get.height * 0.006,
                      ),
                      DottedBorder(
                        color: Colors.black,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(8),
                        strokeWidth: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: SizedBox(
                              width: Get.width * 0.89,
                              height: Get.height * 0.09,
                              child:
                                  Image.asset('assets/images/addVector.png')),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      AppButton(
                        buttonName: AppStrings.next,
                        onTap: () {
                          Get.to(() => LetterScreen());
                        },
                        isIconShow: false,
                        height: Get.height * 0.071,
                        fontSize: 18,
                        fontweight: FontWeight.w600,
                        width: Get.width * 0.93,
                        backgroundColor: AppColors.orange,
                        //iconColor: AppColors.bluishBlack,
                        textColor: Color(0xffFFFFFF),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
