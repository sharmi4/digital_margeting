import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/controller/calender_controller.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:digital_marketing_stratergy/view/calender/generate_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Helper.dart';
import '../../model/responseModel.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getbyDate();
  }

  List seogetdatetask = [];



  void _showModalSheet(BuildContext context) {
    final GeminiController controller = Get.put(GeminiController());

    controller.generateWomensDayContent(); // Trigger generation

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Obx(() {
          if (controller.isLoading.value) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (controller.error.isNotEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(child: Text('Error: ${controller.error.value}')),
            );
          }

          final titles = controller.generatedContent.value?.titles ?? [];
          final description =
              controller.generatedContent.value?.description ?? "";
          final hashtags = controller.generatedContent.value?.hashtags ?? [];

          if (titles.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(child: Text('No titles generated.')),
            );
          }

          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Select your Post Title(s)",
                  style: primaryFont(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      final title = titles[index];
                      return Obx(() {
                        final isSelected = controller.selectedTitles.contains(
                          title,
                        );
                        return InkWell(
                          onTap: () => controller.toggleTitleSelection(title),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Checkbox(
                                  shape: CircleBorder(),
                                  value: isSelected,
                                  onChanged: (bool? value) {
                                    controller.toggleTitleSelection(title);
                                    if (value == true) {
                                      Helper.content.add(
                                        ResponseModel(
                                          titles: title,
                                          description: description,
                                          hashtags: hashtags,
                                        ),
                                      );
                                      print("content --> ${Helper.content}");
                                      print(
                                        "TITLE ---> ${Helper.content[0].titles}",
                                      );
                                      print(
                                        "DESCRIPTION ---> ${Helper.content[0].description}",
                                      );
                                      print(
                                        "HASHTAGS ---> ${Helper.content[0].hashtags}",
                                      );
                                    } else {
                                      Helper.content.removeWhere(
                                        (element) => element.titles == title,
                                      );
                                      print("content --> ${Helper.content}");
                                    }
                                  },
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>((
                                        Set<MaterialState> states,
                                      ) {
                                        if (states.contains(
                                          MaterialState.selected,
                                        )) {
                                          return AppColors.blue;
                                        }
                                        return Colors.white;
                                      }),
                                ),
                                Expanded(
                                  child: Text(title, style: primaryFont()),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    if (controller.selectedTitles.isEmpty) {
                      Get.snackbar(
                        'No Selection',
                        'Please select at least one title.',
                      );
                      return;
                    }
                    Get.to(() => GeneratePostImageScreen());
                  },
                  child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Generate Post image",
                        style: primaryFont(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height + 300, // Adjust as needed
          child: Stack(
            children: [
              // Background Image
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.yellow),
              ),

              // Main content
              SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            // Top Section
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.arrow_back_ios),
                                          Text("Special Days Calendar"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              right: 10,
                                            ),
                                            padding: const EdgeInsets.all(6),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFDEBC0F),
                                            ),
                                            child: const Icon(
                                              Icons.notifications_active_sharp,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              right: 10,
                                            ),
                                            padding: const EdgeInsets.all(6),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFDEBC0F),
                                            ),
                                            child: const Icon(
                                              Icons.settings,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ksizedbox20,
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Positioned Calendar
              Positioned(
                top: 150,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: 380,
                    // you can adjust the height
                    width: MediaQuery.of(context).size.width * 0.87,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.textWhite,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0.0, 0.75),
                          blurRadius: 1,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      selectedDayPredicate:
                          (day) => isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay)  {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay =
                              focusedDay; // update focused day as well
                          print(
                            "selected calender date>>>>>>>>>>>>>>>>>>>>>>>",
                          );

                          print(_selectedDay);

                          getbyDate();
                        });
                      },
                      calendarStyle: const CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 550,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFE17135),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/daily-task-3d.png",
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "International Womens'\nDay",
                                        style: primaryFont(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          height: 1.0,
                                          // line-height / font-size = 18 / 18
                                          letterSpacing: -0.13,
                                          color: AppColors.textWhite,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: InkWell(
                                          onTap: () {
                                            _showModalSheet(context);
                                          },
                                          child: Text(
                                            "Create a Post >",
                                            style: primaryFont(
                                              fontWeight: FontWeight.w300,
                                              // 300 = Light
                                              fontSize: 12.2,
                                              height: 14.64 / 12.2,
                                              // line-height divided by font-size
                                              letterSpacing: -0.13,
                                              color: AppColors.textWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20,right: 20),
                      //   child: Container(
                      //     height: 100,
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //       color: Color(0xFFE17135),
                      //       borderRadius: BorderRadius.circular(10)
                      //     ),
                      //     child: Column(
                      //       children: [
                      //         Row(
                      //           children: [
                      //             Image.asset("assets/images/daily-task-3d.png"),
                      //             Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Text("International Workers'\nDay",
                      //                 style: primaryFont(
                      //                    fontWeight: FontWeight.w600,
                      //     fontSize: 18,
                      //     height: 1.0,          // line-height / font-size = 18 / 18
                      //     letterSpacing: -0.13,
                      //     color: AppColors.textWhite
                      //                 ),),
                      //                 Padding(
                      //                   padding: const EdgeInsets.only(top: 4),
                      //                   child: InkWell(
                      //                     onTap: (){
                      //                       _showModalSheet(context);
                      //                     },
                      //                     child: Text("Create a Post >",
                      //                     style: primaryFont(
                      //                       fontWeight: FontWeight.w300, // 300 = Light
                      //                         fontSize: 12.2,
                      //                         height: 14.64 / 12.2, // line-height divided by font-size
                      //                         letterSpacing: -0.13,
                      //                         color: AppColors.textWhite
                      //                     ),),
                      //                   ),
                      //                 )
                      //               ],
                      //             )
                      //           ],
                      //         ),

                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 24),

                     sData.isNotEmpty? ListView.builder(
                        shrinkWrap: true,
                        itemCount: sData.length,
                        itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor:AppColors.blue ,
                                    child: Center(
                                      child: Icon(Icons.check,
                                      size: 18,
                                      color: AppColors.textWhite,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                        "assets/icons/anlysis.png",
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.fitHeight,
                                        ),
                                         SizedBox(width: 5),
                                        Column(
                                          children: [
                                            Container(
                                              width: 180,
                                              child: Text(sData[index]["taskname"], style:  TextStyle(fontSize: 14))),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.yellow[700],
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Text(
                                              "20XP",
                                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: const Color(0xFFE6F1FF),
                                    child: Icon(
                                      Icons.play_arrow_sharp,
                                      size: 20,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }):Text("No Data")
                      // buildTodayTasksSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTodayTasksSection() {
    final tasks = [
      {"title": "Competitor Analysis", "icon": "assets/icons/anlysis.png"},
      {"title": "Upload a Post", "icon": "assets/icons/post.png"},
      {"title": "Upload Brand Video", "icon": "assets/icons/brand_video.png"},
      {"title": "Send bulk offer SMS", "icon": "assets/icons/sms.png"},
      {
        "title": "Send email to clients",
        "icon": "assets/icons/brand_video.png",
      },
      {"title": "Competitor Analysis", "icon": "assets/icons/anlysis.png"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today Tasks",
                style: primaryFont(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  height: 14.64 / 14,
                  letterSpacing: -0.13,
                ),
              ),
              Row(
                children: [
                  Text(
                    "View All",
                    style: primaryFont(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      height: 1.0,
                      letterSpacing: -0.13,
                      color: AppColors.blue,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: AppColors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Column(children: tasks.map((task) => _buildTaskItem(task)).toList()),
      ],
    );
  }

  Widget _buildTaskItem(Map<String, dynamic> task) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                task["icon"],
                width: 30,
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(width: 10),
              Text(task['title'], style: const TextStyle(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "20XP",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: const Color(0xFFE6F1FF),
            child: Icon(
              Icons.play_arrow_sharp,
              size: 20,
              color: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
  List<Map<String,dynamic>> sData = [];
 void getbyDate() async {
  final rawData = await DatabaseHelper().getSeoTaskByDate(_selectedDay.toString().split(" ")[0]);

  // Remove duplicates based on 'taskname'
  final seen = <String>{};
  sData = rawData.where((element) => seen.add(element['taskname'])).toList();

  print("Filtered SDATA LENGTH --> ${sData.length}");
  setState(() {}); // Update UI after data change
}

}