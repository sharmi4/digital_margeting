import 'package:digital_marketing_stratergy/Helper.dart';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/controller/statergy_controller.dart';
import 'package:digital_marketing_stratergy/helper/loadingHelper.dart';
import 'package:digital_marketing_stratergy/model/seo_statergy_model.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'particular_stratergy_screen.dart';

class StratergyTaskScreen extends StatefulWidget {
  const StratergyTaskScreen({super.key});

  @override
  State<StratergyTaskScreen> createState() => _StratergyTaskScreenState();
}

class _StratergyTaskScreenState extends State<StratergyTaskScreen> {
  final seostatergyController = Get.find<StrategyController>();

  final List<Map<String, dynamic>> taskData = [
    {
      "title": "SEO Strategy",
      "icon": "assets/images/seo.png",
      "completed": 0,
      "total": 0,
      "xp": 500,
      "color": AppColors.blue,
    },
    {
      "title": "Social Media",
      "icon": "assets/images/social.png",
      "completed": 4,
      "total": 10,
      "xp": 800,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Email Marketing",
      "icon": "assets/images/email.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Content Creation",
      "icon": "assets/images/content_creation.png",
      "completed": 2,
      "total": 10,
      "xp": 500,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Google My Business",
      "icon": "assets/images/gmbusinees.png",
      "completed": 9,
      "total": 10,
      "xp": 950,
      "color": AppColors.blue,
    },
  ];

  List<Map<String, dynamic>> seogettask = [];

  @override
  void initState() {
    super.initState();

    statergydbinsert();
    gettaskdb();
  }

  void statergydbinsert() async {
    for (int s = 0; s < taskData.length; s++) {
      await DatabaseHelper().insertstatergydata(
        StrategyModel(
          content: taskData[s]["title"].toString(),
          completedtask: 0,
          totaltask: 0,
          snumber: s,
        ),
      );
    }
  }

  void gettaskdb() async {
    seogettask = await DatabaseHelper().getSeoTaskById(Helper.businessId);
    int completed = seogettask.where((task) => task["iscompleted"] == "1").length;
    int total = seogettask.length;
    taskData[0]["completed"] = completed;
    taskData[0]["total"] = total;
    print(">>>> SEO completed: $completed / $total");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Row(
          children: [
            Text(
              "Digital Marketing Strategy",
              style: primaryFont(
                fontWeight: FontWeight.w500,
                fontSize: 15,
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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Mission Card
            Container(
              height: 110,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF531012),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/mission.png',
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Mission",
                        style: primaryFont(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          height: 15 / 18,
                          letterSpacing: -0.13,
                          color: AppColors.textWhite,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Complete Tasks, Earn XP, \nand Grow your Business",
                        style: primaryFont(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.2,
                          height: 14.64 / 12.2,
                          letterSpacing: -0.13,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// Task Cards
            ListView.builder(
              itemCount: taskData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final task = taskData[index];
                return InkWell(
                  onTap: () async {
                    if (index == 0) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              SeoStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                  },
                  child: buildTaskCard(
                    context,
                    title: task["title"],
                    iconPath: task["icon"],
                    completed: task["completed"],
                    total: task["total"],
                    xp: task["xp"],
                    color: task["color"],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTaskCard(
    BuildContext context, {
    required String title,
    required String iconPath,
    required int completed,
    required int total,
    required int xp,
    required Color color,
  }) {
    final double progress = total > 0 ? completed / total : 0;
    final progressColor =
        (color == AppColors.blue) ? Colors.yellow : Colors.grey;

    return Container(
      height: 142,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Wrap this Row with Flexible to prevent overflow
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        print("Tapped SEO Strategy at: ${DateTime.now()}");

                        LoadingHelper.show(context); // show immediately

                        try {
                          await seostatergyController.submitStrategy();
                        } catch (e) {
                          print("Error submitting strategy: $e");
                          LoadingHelper.hide();
                        } finally {
                          LoadingHelper.hide(); // ensure hide is called even if error happens
                        }

                        print("Navigating to SeoStrategyScreen at: ${DateTime.now()}");

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Get.to(() => SeoStrategyScreen(businessId: Helper.businessId));
                        });

                      },
                      child: Image.asset(
                        iconPath,
                        height: 60,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Your new title and subtitle
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: primaryFont(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppColors.textWhite,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // const SizedBox(height: 2),
                              // InkWell(
                              //   onTap: ()async{
                              //    print("Tapped SEO Strategy at: ${DateTime.now()}");
                              //       LoadingHelper.show();
                              //       await seostatergyController.submitStrategy();
                              //       LoadingHelper.hide();
                              //       print("Navigating to SeoStrategyScreen at: ${DateTime.now()}");
                              //    WidgetsBinding.instance.addPostFrameCallback((_) {
                              //      Get.to(() => SeoStrategyScreen(businessId: Helper.businessId));
                              //    });
                              //   },
                              //   child: Center(
                              //       child: Text(
                              //         "Generate Strategy",
                              //         style: primaryFont(
                              //           fontWeight: FontWeight.w300,
                              //           fontSize: 12.2,
                              //           color: AppColors.textWhite,
                              //         ),
                              //         maxLines: 1,
                              //         overflow: TextOverflow.ellipsis,
                              //       ),
                              //     ),
                              //
                              // ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "${completed.toString().padLeft(2, '0')}/",
                                  style: primaryFont(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 35.59,
                                    height: 1.0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                                TextSpan(
                                  text: "$total Tasks",
                                  style: primaryFont(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16,
                                    height: 1.0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// XP text stays on the right
              Text(
                "$xp XP",
                style: primaryFont(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  height: 1.0,
                  letterSpacing: -0.17,
                  color: progressColor,
                ),
              ),
            ],
          ),

          /// Progress Bar
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 13,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress.clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: progressColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
