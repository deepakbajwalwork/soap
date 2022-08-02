import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/controllers/get_plan_controller.dart';
import 'package:souapp/views/getenvelopes_screen.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class SavingTypeScreen extends StatefulWidget {
  const SavingTypeScreen({Key? key}) : super(key: key);

  @override
  State<SavingTypeScreen> createState() => _SavingTypeScreenState();
}

class _SavingTypeScreenState extends State<SavingTypeScreen> {
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
              top: Get.height * 0.04,
              left: Get.width * 0.13,
              child: Image.asset('assets/images/Saly-45.png')),
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
                            'Start saving',
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
                      Obx(
                        () => ListTile(
                          onTap: () {
                            con.setCycleType = con.randomCycle;
                          },
                          leading: con.getCycleType == con.randomCycle
                              ? Image.asset(
                                  'assets/images/bx-radio-circle-marked 1.png')
                              : SizedBox(),
                          title: Text(
                            'Random Cycle',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          subtitle: Text(
                            ' save any amount you want  daily',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.backgroundblue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Obx(
                        () => ListTile(
                          onTap: () {
                            con.setCycleType = con.fixedCycle;
                          },
                          leading: con.getCycleType == con.fixedCycle
                              ? Image.asset(
                                  'assets/images/bx-radio-circle-marked 1.png',
                                )
                              : SizedBox(),
                          title: Text('Fixed Cycle',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black)),
                          subtitle: Text(
                            ' save any amount you want  daily',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.backgroundblue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      AppButton(
                          buttonName: AppStrings.next,
                          onTap: () {
                            Get.to(() => GetEnvelopesScreen());
                          },
                          isIconShow: false,
                          height: Get.height * 0.071,
                          fontSize: 18,
                          fontweight: FontWeight.w600,
                          width: Get.width * 0.93,
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
    ));
  }
}
