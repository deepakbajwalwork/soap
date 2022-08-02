import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:souapp/views/home_screen.dart';
import 'package:souapp/views/onboard/onboard_screen3.dart';
import 'package:souapp/views/signup_screen.dart';

import '../../models/slider_model.dart';
import '../../utils/appcolors_theme.dart';
import '../../utils/appstrings.dart';
import '../signin_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  late PageController _controller;
  bool isLoginLoad = false;

  checkNavigation() async {
    String token = await GetStorage().read(AppStrings.token).toString();

    if (token.toString().trim() != "null" && token.toString().trim() != '') {
      isLoginLoad = true;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (Route<dynamic> route) => false);
    } else {
      isLoginLoad = true;
    }
  }

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    slides = getSlides();
    checkNavigation();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: !isLoginLoad
            ? SizedBox()
            : PageView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  // contents of slider
                  return Stack(
                    children: [
                      Slider(
                        image: slides[index].getImage(),
                        // heading: slides[index].getHeading(),
                      ),
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      Positioned(
                        top: Get.height * 0.41,
                        left: Get.width * 0.32,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              slides.length,
                              (index) => buildDot(index, context),
                            ),
                          ),
                        ),
                      ),
                      if (currentIndex == slides.length - 1)
                        Positioned(
                          top: Get.height * 0.725,
                          left: Get.width * 0.27,
                          child: SizedBox(
                            child: Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.035),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.off(() => const SignUpScreen());
                                    },
                                    child: Container(
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.44,
                                      decoration: BoxDecoration(
                                          color: AppColors.orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: const Text(
                                          AppStrings.signup,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.off(() => const SignInScreen());
                                    },
                                    child: Container(
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.44,
                                      child: const Center(
                                        child: Text(AppStrings.signin,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: AppColors.fadegrey)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      else
                        Positioned(
                            top: Get.height * 0.714,
                            left: Get.width * 0.88,
                            child: Image.asset(
                                'assets/images/bx-chevron-right-circle 1.png')),
                      if (currentIndex == slides.length - 1)
                        Positioned(
                          top: Get.height * 0.07,
                          left: Get.width * 0.88,
                          child: const SizedBox(),
                        )
                      else
                        Positioned(
                          top: Get.height * 0.07,
                          left: Get.width * 0.88,
                          child: SizedBox(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => const SignUpScreen());
                              },
                              child: const Text(
                                AppStrings.skip,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  );
                }),
        backgroundColor: Colors.white,
      ),
    );
  }

  // container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: Get.height * 0.011,
      width: currentIndex == index ? 8 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: currentIndex == index ? AppColors.white : AppColors.grey,
        //Colors.green,
      ),
    );
  }
}

class Slider extends StatelessWidget {
  Widget? image;

  Slider({this.image});

  @override
  Widget build(BuildContext context) {
    return image!;
  }
}
