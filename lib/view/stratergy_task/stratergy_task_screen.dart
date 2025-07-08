import 'package:digital_marketing_stratergy/Helper.dart';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/controller/statergy_controller.dart';
import 'package:digital_marketing_stratergy/model/seo_statergy_model.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/aeo_task/aeo_stratergy_screen.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/loading_helpers_coustom.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/sem_task/sem_stratergy_screen.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/smm_task/smm_stratergy_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'aio_task/aio_stratergy_screen.dart';
import 'geo_task/geo_stratergy_screen.dart';
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
      "title": "Search Engine Optimization (SEO)",
      "icon": "assets/icons/seo.png",
      "completed": 0,
      "total": 0,
      "xp": 500,
      "color": AppColors.blue,
    },
    {
      "title": "Search Engine Marketing (SEM)",
      "icon": "assets/icons/sem.png",
      "completed": 0,
      "total": 0,
      "xp": 500,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Social Media Marketing (SMM)",
      "icon": "assets/images/social.png",
      "completed": 0,
      "total": 0,
      "xp": 800,
      "color": AppColors.blue,
    },
    {
      "title": "Answer Engine Optimization (AEO) ",
      "icon": "assets/icons/aeo.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Generative Engine Optimization (GEO)",
      "icon": "assets/icons/geo.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "AI Integration Optimization (AIO)",
      "icon": "assets/icons/aio.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Search Experience Optimization (SXO)",
      "icon": "assets/icons/sxo.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },

    {
      "title": "Content Marketing",
      "icon": "assets/images/content_creation.png",
      "completed": 2,
      "total": 10,
      "xp": 500,
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
      "title": "Influencer Marketing",
      "icon": "assets/icons/im.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Affiliate Marketing",
      "icon": "assets/icons/am.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Video Marketing",
      "icon": "assets/icons/vm.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Mobile Marketing",
      "icon": "assets/icons/mm.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Online Reputation Management (ORM)",
      "icon": "assets/icons/orm.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Conversion Rate Optimization (CRO)",
      "icon": "assets/icons/cro.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Web Analytics and Tracking",
      "icon": "assets/icons/wat.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Pay-Per-Click Advertising (PPC)",
      "icon": "assets/icons/ppca.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Programmatic Advertising",
      "icon": "assets/icons/pa.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Remarketing / Retargeting",
      "icon": "assets/icons/Retargeting.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Local SEO",
      "icon": "assets/icons/localseo.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Voice Search Optimization",
      "icon": "assets/icons/vso.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Marketing Automation",
      "icon": "assets/icons/ma.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Chatbot Marketing",
      "icon": "assets/icons/ca.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Community Management",
      "icon": "assets/icons/com.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Digital PR",
      "icon": "assets/icons/dpr.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Webinar and Virtual Event Marketing",
      "icon": "assets/icons/wvem.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "SMS & WhatsApp Marketing",
      "icon": "assets/icons/swm.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Landing Page Optimization",
      "icon": "assets/icons/lpo.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Funnel Building and Optimization",
      "icon": "assets/icons/fbo.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },
    // {
    //   "title": "Google My Business",
    //   "icon": "assets/images/gmbusinees.png",
    //   "completed": 9,
    //   "total": 10,
    //   "xp": 950,
    //   "color": AppColors.blue,
    // },
  ];

  List<Map<String, dynamic>> seogettask = [];
  List<Map<String, dynamic>> semgettask = [];
  List<Map<String, dynamic>> smmgettask = [];
  List<Map<String, dynamic>> aeogettask = [];
  List<Map<String, dynamic>> geogettask = [];
  List<Map<String, dynamic>> aiogettask = [];

  @override
  void initState() {
    super.initState();

    statergydbinsert();
    gettaskdb();
    getSEMtaskdb();
    getSMMtaskdb();
    getAEOtaskdb();
    getGEOtaskdb();
    getAIOtaskdb();
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
    int completed =
        seogettask.where((task) => task["iscompleted"] == "1").length;
    int total = seogettask.length;
    taskData[0]["completed"] = completed;
    taskData[0]["total"] = total;
    print(">>>> SEO completed: $completed / $total");
    setState(() {});
  }

  void getSEMtaskdb() async {
    semgettask = await DatabaseHelper().getSEMTaskById(Helper.businessId);
    int completed =
        semgettask.where((task) => task["iscompleted"] == "1").length;
    int total = semgettask.length;
    taskData[1]["completed"] = completed;
    taskData[1]["total"] = total;
    print(">>>> SEM completed: $completed / $total");
    setState(() {});
  }

  void getSMMtaskdb() async {
    smmgettask = await DatabaseHelper().getSMMTaskById(Helper.businessId);
    int completed =
        smmgettask.where((task) => task["iscompleted"] == "1").length;
    int total = smmgettask.length;
    taskData[2]["completed"] = completed;
    taskData[2]["total"] = total;
    print(">>>> SMM completed: $completed / $total");
    setState(() {});
  }

  void getAEOtaskdb() async {
    aeogettask = await DatabaseHelper().getAEOTaskById(Helper.businessId);
    int completed =
        aeogettask.where((task) => task["iscompleted"] == "1").length;
    int total = aeogettask.length;
    taskData[3]["completed"] = completed;
    taskData[3]["total"] = total;
    print(">>>> aeo completed: $completed / $total");
    setState(() {});
  }

  void getGEOtaskdb() async {
    geogettask = await DatabaseHelper().getGEOTaskById(Helper.businessId);
    int completed =
        geogettask.where((task) => task["iscompleted"] == "1").length;
    int total = geogettask.length;
    taskData[4]["completed"] = completed;
    taskData[4]["total"] = total;
    print(">>>> SMM completed: $completed / $total");
    setState(() {});
  }

  void getAIOtaskdb() async {
    aiogettask = await DatabaseHelper().getAIOTaskById(Helper.businessId);
    int completed =
        aiogettask.where((task) => task["iscompleted"] == "1").length;
    int total = aiogettask.length;
    taskData[4]["completed"] = completed;
    taskData[4]["total"] = total;
    print(">>>> AIO completed: $completed / $total");
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
                    if (index == 1) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              SemStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                    if (index == 2) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              SmmStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                    if (index == 3) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              AeoStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                    if (index == 4) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              GeoStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                    if (index == 5) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              AioStrategyScreen(businessId: Helper.businessId),
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
                    index: index,
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
    required int index,
  }) {
    final double progress = total > 0 ? completed / total : 0;
    final progressColor =
        (color == AppColors.blue) ? Colors.yellow : Colors.grey;

    return Container(
      height: 164,
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
                      onTap: () async {},
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
                                maxLines: 2,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () async {
                  if (index == 0) {
                    print("Tapped SEO Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to SeoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => SeoStrategyScreen(businessId: Helper.businessId),
                    );
                  }
                  if (index == 1) {
                    print("Tapped SEm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitSEMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to SeoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => SemStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                  if (index == 2) {
                    print("Tapped Smm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitSMMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to SmmoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => SmmStrategyScreen(businessId: Helper.businessId),
                    );
                  }
                   if (index == 3) {
                    print("Tapped Smm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitAEOStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to aeoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => AeoStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                   if (index == 4) {
                    print("Tapped geo Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitGEOStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to geoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => GeoStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                   if (index == 5) {
                    print("Tapped aio Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitAIOStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to geoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => AioStrategyScreen(businessId: Helper.businessId),
                    );
                  }
                },
                child: Text(
                  "Generate Statregy",
                  style: primaryFont(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textWhite,
                  ),
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
