import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/view/menu/profile/leader_board_screen.dart';
import 'package:digital_marketing_stratergy/view/menu/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Stratergy_details/stratergy_list_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

List image = [
  "assets/images/stergery_details.png",
  "assets/images/brand_details.png",
  "assets/images/profile_details.png",
  "assets/images/task_order.png",
  "assets/images/bench_mark.png",
  "assets/images/brand_adit.png",
  "assets/images/leader_board.png",
  "assets/images/community.png",
  "assets/images/security.png",
  "assets/images/terms_condition.png",
  "assets/images/privacy_policy.png"
];

List title  = [
  "Strategy Details",
  "Brand Details",
  "Profile",
  "Task Orders",
  "Benchmark",
  "Brand Audit",
  "Leaderboard",
  "Community",
  "Security & Privacy",
  "Terms & Conditions",
  "Privacy Policy"

];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
            appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Row(
          children: [
            Text(
              "Options Menu",
              style: primaryFont(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1.2,
                letterSpacing: -0.17,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE6F1FF),
            ),
            child: const Icon(
              Icons.notifications_active_sharp,
              color: Colors.blue,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            children: [
             ksizedbox20,
             ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: image.length,
              itemBuilder: (context,index){
              return GestureDetector(
                onTap: () {
                  if(index==0){
                    Get.to(StratergyListScreen());
                  }
                  if(index==2){
                    Get.to(ProfileScreen());
                  }if(index==6){
                    Get.to(LeaderboardScreen());
                  }
                },
                child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Image.asset(image[index],
                              fit: BoxFit.fitHeight,
                              height: 40,),
                              Padding(
                                padding:  EdgeInsets.only(left: 10),
                                child: Text(title[index],
                                style: primaryFont(
                                  fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 14.64 / 14, // This gives a line height of 14.64px
                    letterSpacing: -0.13,
                                ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                        color: AppColors.grey,)
                      ],
                    ),
                    ksizedbox10,
                    Divider()
                  ],
                ),
                ),
              );
             })
            ],
          ),
        ),
      ),
    );
  }
}