import 'package:digital_marketing_stratergy/Helper.dart';
import 'package:digital_marketing_stratergy/bottom_nav/bottom_navigation_screen.dart';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/model/seo_database_taskmodel.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/task_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SEMParticulartaskProgressScreen extends StatefulWidget {
  String instructions;
  String type;
  String category;

  SEMParticulartaskProgressScreen({
    super.key,
    required this.instructions,
    required this.category,
    required this.type,
  });

  @override
  State<SEMParticulartaskProgressScreen> createState() =>
      _SEMParticulartaskProgressScreenState();
}

class _SEMParticulartaskProgressScreenState
    extends State<SEMParticulartaskProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textWhite,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Helper.selectedstartergytitle,
              style: primaryFont(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                height: 1,
                letterSpacing: -0.17,
              ),
              softWrap: true,
            ),
            // Add more widgets here if needed
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF5A53D3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/daily_task.png"),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Task",
                        style: primaryFont(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.0,
                          // line-height: 100%
                          letterSpacing: -0.13,
                          color: AppColors.textWhite,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: 200,
                          child: Column(
                            children: [
                              Text(
                                Helper.selectedstartergytitle,
                                style: primaryFont(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  height: 1.0,
                                  letterSpacing: -0.13,
                                  color: AppColors.textWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Text(
                              "SEM",
                              style: primaryFont(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1.0,
                                letterSpacing: -0.13,
                                color: AppColors.textWhite,
                              ),
                            ),
                            SizedBox(width: 8),
                            ksizedbox10,
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "+50xp",
                                style: primaryFont(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  height: 1.0,
                                  letterSpacing: -0.17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Instructions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Task Instructions",
                  style: primaryFont(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 14.64 / 14,
                    // ≈ 1.0457
                    letterSpacing: -0.13,
                    color: AppColors.black,
                  ),
                ),
                Icon(Icons.info_outline, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.instructions
                  .split('\n')
                  .map((line) => '• $line')
                  .join('\n\n'), // Double line break for spacing
              style: primaryFont(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                height: 1, // Optional: increase line height
                letterSpacing: -0.13,
              ),
            ),

            SizedBox(height: 8),

            ksizedbox30,
            // Video Tutorial
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFFCFECFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/live_example.png"),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Live Example",
                            style: primaryFont(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              height: 18 / 10, // = 1.8
                              letterSpacing: -0.17,
                            ),
                          ),
                          Text(
                            "Watch Video Tutorial",
                            style: primaryFont(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              height: 18 / 15, // = 1.2
                              letterSpacing: -0.17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow_sharp,
                      size: 25,
                      color: AppColors.blue,
                    ),
                  ),
                ],
              ),
            ),
            ksizedbox40,
            // Mark as Done Button
            InkWell(
              onTap: () async {
                Get.to(TaskOrdersScreen());
              },
              child: Container(
                height: 52,
                width: 317,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Mark as Done",
                    style: primaryFont(
                      fontWeight: FontWeight.w500,
                      // Equivalent to font-weight: 500
                      fontSize: 15.0,
                      // Equivalent to font-size: 15px
                      height: 1.2,
                      // line-height: 18px / 15px = 1.2
                      letterSpacing: -0.17,
                      // Slightly tight letter spacing
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ),
            ),
            ksizedbox20,
            InkWell(
              onTap: () {
                print("TASK ID ==== > ${ Helper.taskId}");
                DatabaseHelper().updateSEMtask(
                  SeoTaskModel(
                    id: Helper.semtaskId,
                    taskname: Helper.Semselectedstartergytitle,
                    insturctions: widget.instructions,
                    iscompleted: 1,
                    snumber: Helper.semsnumber,
                    date: DateTime.now().toString().split(" ")[0],
                    type: widget.type,
                    businessId: Helper.businessId,
                  ),
                );

                Get.to(BottomBar());
              },
              child: Container(
                height: 52,
                width: 317,
                decoration: BoxDecoration(
                  color: AppColors.darkyellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Get it Done",
                    style: primaryFont(
                      fontWeight: FontWeight.w500,
                      // Equivalent to font-weight: 500
                      fontSize: 15.0,
                      // Equivalent to font-size: 15px
                      height: 1.2,
                      // line-height: 18px / 15px = 1.2
                      letterSpacing: -0.17,
                      // Slightly tight letter spacing
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),

            // Get it Done Button
          ],
        ),
      ),
    );
  }
}
