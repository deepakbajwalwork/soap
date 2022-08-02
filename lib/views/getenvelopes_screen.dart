import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/controllers/get_plan_controller.dart';
import 'package:souapp/views/frequency_screen.dart';

import '../utils/app_button.dart';
import '../utils/appcolors_theme.dart';
import '../utils/appstrings.dart';

class GetEnvelopesScreen extends StatefulWidget {
  const GetEnvelopesScreen({Key? key}) : super(key: key);

  @override
  State<GetEnvelopesScreen> createState() => _GetEnvelopesScreenState();
}

class _GetEnvelopesScreenState extends State<GetEnvelopesScreen> {
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
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
          ),
          Positioned(
            top: Get.height * 0.08,
            left: Get.width * 0.2,
            child: Image.asset(
              'assets/images/Saly-45.png',
            ),
          ),
          Positioned(
            top: Get.height * 0.05,
            left: Get.width * 0.87,
            child: Image.asset(
              'assets/images/vector2.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.43),
            child: Container(
              height: Get.height * 0.75,
              width: Get.width * 0.999,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(
                    40.0,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.04, right: Get.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.027,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Get Envelopes',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: AppColors.textblue,
                          ),
                        ),
                        const Text(
                          '1/2',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.textblue,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/30 envelopes.png'),
                        Image.asset('assets/images/50 envelopes.png'),
                        Image.asset('assets/images/100 envelopes.png'),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/120envelopes.png'),
                        Image.asset('assets/images/150envelopes.png'),
                        Image.asset('assets/images/other.png'),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Preferred Amount",
                      ),
                      controller: con.prefredAmount,
                    ),
                    SizedBox(
                      height: Get.height * 0.006,
                    ),
                    Container(
                      height: Get.height * 0.058,
                      width: Get.width * 0.93,
                      padding: EdgeInsets.only(
                          left: Get.width * 0.02, top: Get.height * 0.014),
                      decoration: BoxDecoration(
                          color: AppColors.filledcolor,
                          border: Border.all(color: AppColors.textblack)),
                      child: Text(
                        '25',
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    AppButton(
                        buttonName: AppStrings.next,
                        onTap: () {
                          Get.to(() => FrequencyScreen());
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
          )
        ],
      ),
    ));
  }
}
