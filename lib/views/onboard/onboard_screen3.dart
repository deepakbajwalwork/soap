import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appcolors_theme.dart';

class OnBoardScreen3 extends StatelessWidget {
  const OnBoardScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundblue,
          body: Row(
            children: [
              SizedBox(
                height: Get.height*0.999,
                child: Image.asset('assets/images/vector.png',fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height*0.31, left: Get.width*0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/IMG-0179 1.png'),
                    SizedBox(height: Get.height*0.048,),
                    SizedBox(
                        width: Get.width*0.5,
                        child: Text('Visualise the dream you want',
                          maxLines: 2,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.white),)),
                    SizedBox(height: Get.height*0.04,),
                    SizedBox(
                        width: Get.width*0.4,
                        child: Text('Add reminders of your saving motivation to inspire you when you need it ',
                          maxLines: 4,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.fadegrey),))
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
