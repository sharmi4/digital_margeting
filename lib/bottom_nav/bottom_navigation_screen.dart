import 'dart:io';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:digital_marketing_stratergy/bottom_nav/tap_item.dart';
import 'package:digital_marketing_stratergy/view/calender/calender_screen.dart';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/view/dashboard/home_screen.dart';
import 'package:digital_marketing_stratergy/view/insights/insights_screen.dart';
import 'package:digital_marketing_stratergy/view/menu/menu_screen.dart';
import 'package:digital_marketing_stratergy/view/menu/stratergy_details/stratergy_list_screen.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/stratergy_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  final int index;
  BottomBar({Key? key, this.index = 0}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedItemPosition = 0;

  @override
  void initState() {
    super.initState();
    _selectedItemPosition = widget.index;
  }

  final List<Widget> screens = [
    HomeScreen(),
    StratergyTaskScreen(),
    // StratergyListScreen(),
    CalenderScreen(),
    InsightsScreen(),
    MenuScreen()
  ];

  final List<TabItem> tabItems = [
    TabItem(
      'assets/icons/Home.svg',
      "Home",
      AppColors.blue,
      circleStrokeColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.white),
    ),
    TabItem(
      'assets/icons/Test.svg',
      "Strategy Tasks",
      AppColors.yellow,
      circleStrokeColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.white),
    ),
    TabItem(
      'assets/icons/Google calendar.svg',
      "Calendar",
      AppColors.yellow,
      circleStrokeColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.white),
    ),
    TabItem(
      'assets/icons/Pie graph.svg',
      "Insights",
      AppColors.yellow,
      circleStrokeColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.white),
    ),
    TabItem(
      'assets/icons/Vector (3).svg',
      "Menu",
      AppColors.yellow,
      circleStrokeColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.white),
    ),
  ];

  Future<bool> back() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          title: Column(
            children: [
              SvgPicture.asset('assets/images/exit.png'),
            ],
          ),
          content: const Text(
            "Are you sure want to exit?",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text("Cancel", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => exit(0),
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text("Exit", style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Scaffold(
        backgroundColor: AppColors.textWhite,
        body: screens[_selectedItemPosition],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.textWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: AnimatedBottomNavigationBar.builder(
                itemCount: tabItems.length,
                tabBuilder: (int index, bool isActive) {
                  final tab = tabItems[index];
                  final color = isActive ? AppColors.blue : AppColors.grey;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        tab.icon,
                        width: 26,
                        height: 26,
                        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                      ),
                    
                      Text(
                        tab.title,
                        style: tab.labelStyle.copyWith(
                          color: color,
                          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                          fontSize: isActive ?12:10,
                        ),
                      ),
                    ],
                  );
                },
                backgroundColor: Colors.transparent,
                activeIndex: _selectedItemPosition,
                gapWidth: 10,
                notchSmoothness: NotchSmoothness.defaultEdge,
                elevation: 0,
                height: 60,
                onTap: (index) => setState(() => _selectedItemPosition = index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
