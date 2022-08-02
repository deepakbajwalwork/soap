import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/controllers/get_plan_controller.dart';
import 'package:souapp/views/savingtype_screen.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class LetterScreen extends StatefulWidget {
  const LetterScreen({Key? key}) : super(key: key);

  @override
  State<LetterScreen> createState() => _LetterScreenState();
}

class _LetterScreenState extends State<LetterScreen> {
  var con = Get.put(GetPlanController());

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
            ),
          ),
          Positioned(
              top: Get.height * 0.11,
              left: Get.width * 0.25,
              child: Image.asset('assets/images/Saly-26.png')),
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
                  topRight: const Radius.circular(
                    40.0,
                  ),
                ),
              ),
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
                            'Add a letter to yourself',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.textblue),
                          ),
                          Text(
                            '2/2',
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
                      Container(
                        height: Get.height * 0.2,
                        width: Get.width * 0.93,
                        padding: EdgeInsets.only(
                            left: Get.width * 0.02, top: Get.height * 0.014),
                        decoration: BoxDecoration(
                            color: AppColors.filledcolor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.textblack)),
                        child: TextFormField(
                          controller: con.letterController,
                          maxLines: 7,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        '0/250 characters',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.backgroundblue),
                      ),
                      SizedBox(
                        height: Get.height * 0.09,
                      ),
                      AppButton(
                        buttonName: AppStrings.next,
                        onTap: () {
                          Get.to(() => SavingTypeScreen());
                        },
                        isIconShow: false,
                        height: Get.height * 0.071,
                        fontSize: 18,
                        fontweight: FontWeight.w600,
                        width: Get.width * 0.93,
                        backgroundColor: AppColors.orange,
                        //iconColor: AppColors.bluishBlack,
                        textColor: Color(
                          0xffFFFFFF,
                        ),
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
