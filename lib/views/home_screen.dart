import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souapp/utils/appcolors_theme.dart';
import 'package:souapp/views/account_screen.dart';
import 'package:souapp/views/cycles_screen.dart';
import 'package:souapp/views/notification_screen.dart';
import 'package:souapp/views/resources_screen.dart';
import '../controllers/get_plan_controller.dart';
import 'planname_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey bottomNavigationKey = GlobalKey();
  int currentPage = 0;

  var con = Get.put(GetPlanController());
  @override
  Widget build(BuildContext context) {
    con.getPlan(
      refresh: true,
    );
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundblue,
      body: _getPage(currentPage),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/home 1.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/graph 1.png')),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/bx-bell 2.png')),
            label: 'Notificatons',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/target.png')),
            label: 'Cycles',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/user 1.png')),
            label: 'Account',
          )
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    ));
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.04,
                    right: Get.width * 0.04,
                    top: Get.height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hi,Vee',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: AppColors.white),
                    ),
                    Image.asset(
                      'assets/images/bxs-bell 1.png',
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.04,
                    right: Get.width * 0.04,
                    top: Get.height * 0.002),
                child: const Text(
                  'One day less to reach our goal',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.white),
                ),
              ),
              SizedBox(
                height: Get.height * 0.035,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.04, right: Get.width * 0.04),
                child: Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xffFFFFFF),
                        Color(0xffFFEDDA),
                        Color(0xffCAE0FF),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.011,
                      ),
                      const Text(
                        'Total SOU days',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.lightblack),
                      ),
                      SizedBox(
                        height: Get.height * 0.011,
                      ),
                      const Text(
                        '25/100',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: AppColors.textblue),
                      ),
                      SizedBox(
                        height: Get.height * 0.049,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Days Saved',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors.lightblack)),
                              SizedBox(
                                height: Get.height * 0.009,
                              ),
                              Text(
                                '20/100',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.grey),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Days Missed',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors.lightblack)),
                              SizedBox(
                                height: Get.height * 0.009,
                              ),
                              Text(
                                '5/100',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.grey),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Days  Left',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors.lightblack)),
                              SizedBox(
                                height: Get.height * 0.009,
                              ),
                              Text(
                                '75/100',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.grey),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                height: Get.height * 0.520,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.03, right: Get.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        const Text(
                          'Your  Saving Cycles',
                          style: TextStyle(
                              color: AppColors.textblue,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: Get.height * 0.009,
                        ),
                        const Text(
                            'Up to 100 free envelopes on your first circle'),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        SizedBox(
                          height: Get.height * 0.25,
                          width: Get.width * 0.99,
                          child: Obx(
                            () => !(con.getPlansList.data != null &&
                                    con.getPlansList.data!.isNotEmpty)
                                ? SizedBox()
                                : ListView.separated(
                                    //padding: const EdgeInsets.all(6),
                                    itemCount: con.getPlansList != null &&
                                            con.getPlansList.data!.isNotEmpty
                                        ? con.getPlansList.data!.length + 1
                                        : 1,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            SizedBox(
                                              width: Get.width * 0.042,
                                            ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index == 0) {
                                        return Container(
                                          height: Get.height * 0.32,
                                          width: Get.width * 0.45,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              color: AppColors.filledcolor,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: InkWell(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      AppColors.white,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Get.to(
                                                          const PlanNameScreen());
                                                    },
                                                    icon: const Icon(Icons.add),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.01,
                                                ),
                                                const Text(
                                                  'start new plan',
                                                  style: TextStyle(
                                                      color: AppColors.textblue,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                            height: Get.height * 0.32,
                                            width: Get.width * 0.45,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                color: AppColors.backgroundblue,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Image.asset(
                                                    'assets/images/schoolphoto.png',
                                                    // height: Get.height * 0.20,
                                                    width: Get.width * 0.35,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 12.0, bottom: 5),
                                                  child: Text(
                                                    con.getPlansList
                                                        .data![index - 1].name
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 12.0, bottom: 8),
                                                  child: Text(
                                                    "\$ ${con.getPlansList.data![index - 1].topupAmount.toString()}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ));
                                      }
                                    }),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.05),
                        SizedBox(
                          width: Get.width * 0.99,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset('assets/images/Group 895.png'),
                                  SizedBox(
                                    height: Get.height * 0.009,
                                  ),
                                  Text(
                                    'Top Up',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColors.black),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset('assets/images/Group 896.png'),
                                  SizedBox(
                                    height: Get.height * 0.009,
                                  ),
                                  Text(
                                    'Goals',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColors.black),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset('assets/images/Group 897.png'),
                                  SizedBox(
                                    height: Get.height * 0.009,
                                  ),
                                  Text(
                                    'challenge',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColors.black),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ongoing Challenges',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textblue),
                            ),
                            Text(
                              'View All',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: AppColors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        SizedBox(
                          height: Get.height * 0.15,
                          width: Get.width * 0.99,
                          child: ListView.separated(
                              padding: const EdgeInsets.all(8),
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                        width: Get.width * 0.042,
                                      ),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: Get.width * 0.7,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: AppColors.lightpink,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.textblue),
                                              color: AppColors.orange),
                                          child: Image.asset(
                                              'assets/images/Rectangle 27 (3).png')),
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: Get.height * 0.035,
                                          ),
                                          Text(
                                            'No soda/coffee month',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: AppColors.textblue),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.007,
                                          ),
                                          Text(
                                            'Build healthy habits',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.grey),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recent transactions',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textblue),
                            ),
                            Text(
                              'View History',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: AppColors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        SizedBox(
                          height: Get.height * 0.14,
                          child: ListView.builder(
                            // padding: const EdgeInsets.all(8),
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/Group 796.png'),
                                          SizedBox(
                                            width: Get.width * 0.018,
                                          ),
                                          Text(
                                            'Deposit',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.textblue),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '100',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.grey),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: AppColors.textblue,
                                    thickness: 1,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        Container(
                          height: Get.height * 0.17,
                          width: Get.width * 0.91,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: AppColors.lightpink,
                              borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.textblue),
                                      color: AppColors.orange),
                                  child:
                                      Image.asset('assets/images/youtube.png')),
                              Text(
                                'Buy New Gadgets',
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    size: 18,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      case 1:
        return ResourcesScreen();
      case 2:
        return const NotificationScreen();
      case 3:
        return CyclesScreen();
      case 4:
        return const AccountScreen();
    }
  }
}
