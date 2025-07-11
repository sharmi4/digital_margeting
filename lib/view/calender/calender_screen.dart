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
    semgetbyDate();
    smmgetbyDate();
    aeogetbyDate();
    geogetbyDate();
    aiogetbyDate();
    sxogetbyDate();
    cmgetbyDate();
    emgetbyDate();
    imgetbyDate();
    amgetbyDate();
    vmgetbyDate();
    mmgetbyDate();
    ormgetbyDate();
    crogetbyDate();
    watgetbyDate();
    ppcgetbyDate();
    pagetbyDate();
    rrgetbyDate();
    lsgetbyDate();
    vsogetbyDate();
    magetbyDate();
    chatmgetbyDate();
    commumgetbyDate();
    dpgetbyDate();
    wvemgetbyDate();
    swmgetbyDate();
    lpogetbyDate();
    fbaogetbyDate();
  }

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
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay =
                              focusedDay; // update focused day as well
                          print(
                            "selected calender date>>>>>>>>>>>>>>>>>>>>>>>",
                          );

                          print(_selectedDay);

                          getbyDate();
                          semgetbyDate();
                          smmgetbyDate();
                          aeogetbyDate();
                          geogetbyDate();
                          aiogetbyDate();
                          sxogetbyDate();
                          cmgetbyDate();
                          emgetbyDate();
                          imgetbyDate();
                          amgetbyDate();
                          vmgetbyDate();
                          mmgetbyDate();
                          ormgetbyDate();
                          crogetbyDate();
                          watgetbyDate();
                          ppcgetbyDate();
                          pagetbyDate();
                          rrgetbyDate();
                          lsgetbyDate();
                          vsogetbyDate();
                          magetbyDate();
                          chatmgetbyDate();
                          commumgetbyDate();
                          dpgetbyDate();
                          wvemgetbyDate();
                          swmgetbyDate();
                          lpogetbyDate();
                          fbaogetbyDate();
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

                      // SEO
                      if (seoData.isNotEmpty)
                        ListView.builder(
                          itemCount: seoData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/sem.png",
                                taskName: seoData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                      // SEM
                      if (semData.isNotEmpty)
                        ListView.builder(
                          itemCount: semData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/sem.png",
                                taskName: semData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                      // SMM
                      if (smmData.isNotEmpty)
                        ListView.builder(
                          itemCount: smmData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/images/social.png",
                                taskName: smmData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                      // AEO
                      if (aeoData.isNotEmpty)
                        ListView.builder(
                          itemCount: aeoData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/aeo.png",
                                taskName: aeoData[index]["taskname"],
                              ),
                            );
                          },
                        ),
                         // GEO
                      if (geoData.isNotEmpty)
                        ListView.builder(
                          itemCount: geoData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/geo.png",
                                taskName: geoData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                           // GEO
                      if (aioData.isNotEmpty)
                        ListView.builder(
                          itemCount: aioData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/aio.png",
                                taskName: aioData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                          if (sxoData.isNotEmpty)
                        ListView.builder(
                          itemCount: sxoData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/sxo.png",
                                taskName: sxoData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                          if (cmData.isNotEmpty)
                        ListView.builder(
                          itemCount: cmData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/images/content_creation.png",
                                taskName: cmData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                          if (emData.isNotEmpty)
                        ListView.builder(
                          itemCount: emData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/images/email.png",
                                taskName: emData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                        if (imData.isNotEmpty)
                        ListView.builder(
                          itemCount: imData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/im.png",
                                taskName: imData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                        if (amData.isNotEmpty)
                        ListView.builder(
                          itemCount: amData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/am.png",
                                taskName: amData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                           if (vmData.isNotEmpty)
                        ListView.builder(
                          itemCount: vmData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/vm.png",
                                taskName: vmData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                           if (mmData.isNotEmpty)
                        ListView.builder(
                          itemCount: mmData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/mm.png",
                                taskName: mmData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                             if (ormData.isNotEmpty)
                        ListView.builder(
                          itemCount: ormData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/orm.png",
                                taskName: ormData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                     if (croData.isNotEmpty)
                        ListView.builder(
                          itemCount: croData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/cro.png",
                                taskName: croData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                         if (watData.isNotEmpty)
                        ListView.builder(
                          itemCount: watData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/wat.png",
                                taskName: watData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                         if (ppcData.isNotEmpty)
                        ListView.builder(
                          itemCount: ppcData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/ppca.png",
                                taskName: ppcData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                           if (paData.isNotEmpty)
                        ListView.builder(
                          itemCount: paData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/pa.png",
                                taskName: paData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                            if (rrData.isNotEmpty)
                        ListView.builder(
                          itemCount: rrData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/Retargeting.png",
                                taskName: rrData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                        if (lsData.isNotEmpty)
                        ListView.builder(
                          itemCount: lsData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/localseo.png",
                                taskName: lsData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                            if (vsoData.isNotEmpty)
                        ListView.builder(
                          itemCount: vsoData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/vso.png",
                                taskName: vsoData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                              if (maData.isNotEmpty)
                        ListView.builder(
                          itemCount: maData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/ma.png",
                                taskName: maData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                              if (chatmData.isNotEmpty)
                        ListView.builder(
                          itemCount: chatmData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/ca.png",
                                taskName: chatmData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                  if (commumData.isNotEmpty)
                        ListView.builder(
                          itemCount: commumData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/com.png",
                                taskName: commumData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                    if (dpData.isNotEmpty)
                        ListView.builder(
                          itemCount: dpData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/dpr.png",
                                taskName: dpData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                        if (wvemData.isNotEmpty)
                        ListView.builder(
                          itemCount: wvemData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/wvem.png",
                                taskName: wvemData[index]["taskname"],
                              ),
                            );
                          },
                        ),
                         
                          if (swmData.isNotEmpty)
                        ListView.builder(
                          itemCount: swmData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/swm.png",
                                taskName: swmData[index]["taskname"],
                              ),
                            );
                          },
                        ),

                            if (lpoData.isNotEmpty)
                        ListView.builder(
                          itemCount: lpoData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/lpo.png",
                                taskName: lpoData[index]["taskname"],
                              ),
                            );
                          },
                        ),
                               if (fbaoData.isNotEmpty)
                        ListView.builder(
                          itemCount: fbaoData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/fbo.png",
                                taskName: fbaoData[index]["taskname"],
                              ),
                            );
                          },
                        ),
              
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

  //seo
  List<Map<String, dynamic>> seoData = [];

  void getbyDate() async {
    final rawData = await DatabaseHelper().getSeoTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    seoData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${seoData.length}");
    setState(() {}); // Update UI after data change
  }

  //sem
  List<Map<String, dynamic>> semData = [];

  void semgetbyDate() async {
    final rawData = await DatabaseHelper().getSEMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    semData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${semData.length}");
    setState(() {}); // Update UI after data change
  }

  //smm
  List<Map<String, dynamic>> smmData = [];

  void smmgetbyDate() async {
    final rawData = await DatabaseHelper().getSMMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    smmData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${smmData.length}");
    setState(() {}); // Update UI after data change
  }

  //aeo
  List<Map<String, dynamic>> aeoData = [];

  void aeogetbyDate() async {
    final rawData = await DatabaseHelper().getAEOTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    aeoData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${aeoData.length}");
    setState(() {}); // Update UI after data change
  }

    //geo
  List<Map<String, dynamic>> geoData = [];

  void geogetbyDate() async {
    final rawData = await DatabaseHelper().getGEOTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    geoData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${geoData.length}");
    setState(() {}); // Update UI after data change
  }

  List<Map<String, dynamic>> aioData = [];

  void aiogetbyDate() async {
    final rawData = await DatabaseHelper().getAIOTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    aioData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${aioData.length}");
    setState(() {}); // Update UI after data change
  }

    List<Map<String, dynamic>> sxoData = [];

  void sxogetbyDate() async {
    final rawData = await DatabaseHelper().getSXOTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    sxoData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${sxoData.length}");
    setState(() {}); // Update UI after data change
  }

  List<Map<String, dynamic>> cmData = [];

  void cmgetbyDate() async {
    final rawData = await DatabaseHelper().getCMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    cmData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${cmData.length}");
    setState(() {}); // Update UI after data change
  }

  List<Map<String, dynamic>> emData = [];

  void emgetbyDate() async {
    final rawData = await DatabaseHelper().getEMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    emData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${emData.length}");
    setState(() {}); // Update UI after data change
  }

    List<Map<String, dynamic>> imData = [];

  void imgetbyDate() async {
    final rawData = await DatabaseHelper().getIMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    imData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${imData.length}");
    setState(() {}); // Update UI after data change
  }
  

  List<Map<String, dynamic>> amData = [];

  void amgetbyDate() async {
    final rawData = await DatabaseHelper().getAMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    amData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${amData.length}");
    setState(() {}); // Update UI after data change
  }

    List<Map<String, dynamic>> vmData = [];

  void vmgetbyDate() async {
    final rawData = await DatabaseHelper().getVMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    vmData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${vmData.length}");
    setState(() {}); // Update UI after data change
  }


      List<Map<String, dynamic>> mmData = [];

  void mmgetbyDate() async {
    final rawData = await DatabaseHelper().getMMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    mmData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${vmData.length}");
    setState(() {}); // Update UI after data change
  }

        List<Map<String, dynamic>> ormData = [];

  void ormgetbyDate() async {
    final rawData = await DatabaseHelper().getORMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    ormData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${ormData.length}");
    setState(() {}); // Update UI after data change
  }

  List<Map<String, dynamic>> croData = [];

  void crogetbyDate() async {
    final rawData = await DatabaseHelper().getCROTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    croData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${croData.length}");
    setState(() {}); // Update UI after data change
  }

    List<Map<String, dynamic>> watData = [];

  void watgetbyDate() async {
    final rawData = await DatabaseHelper().getWATTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    watData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${watData.length}");
    setState(() {}); // Update UI after data change
  }

      List<Map<String, dynamic>> ppcData = [];

  void ppcgetbyDate() async {
    final rawData = await DatabaseHelper().getPPCTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    ppcData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${ppcData.length}");
    setState(() {}); // Update UI after data change
  }

       List<Map<String, dynamic>> paData = [];

  void pagetbyDate() async {
    final rawData = await DatabaseHelper().getPATaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    paData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${paData.length}");
    setState(() {}); // Update UI after data change
  }

  List<Map<String, dynamic>> rrData = [];

  void rrgetbyDate() async {
    final rawData = await DatabaseHelper().getRRTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    rrData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${rrData.length}");
    setState(() {}); // Update UI after data change
  }
  
    List<Map<String, dynamic>> lsData = [];

  void lsgetbyDate() async {
    final rawData = await DatabaseHelper().getLSTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    lsData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${lsData.length}");
    setState(() {}); // Update UI after data change
  }

    
    List<Map<String, dynamic>> vsoData = [];

  void vsogetbyDate() async {
    final rawData = await DatabaseHelper().getVSOTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    vsoData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${vsoData.length}");
    setState(() {}); // Update UI after data change
  }
  
    List<Map<String, dynamic>> maData = [];

  void magetbyDate() async {
    final rawData = await DatabaseHelper().getMATaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    maData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${maData.length}");
    setState(() {}); // Update UI after data change
  }

  
    List<Map<String, dynamic>> chatmData = [];

  void chatmgetbyDate() async {
    final rawData = await DatabaseHelper().getCHATMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    chatmData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${chatmData.length}");
    setState(() {}); // Update UI after data change
  }

      List<Map<String, dynamic>> commumData = [];

  void commumgetbyDate() async {
    final rawData = await DatabaseHelper().getCOMMUMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    commumData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${commumData.length}");
    setState(() {}); // Update UI after data change
  }


        List<Map<String, dynamic>> dpData = [];

  void dpgetbyDate() async {
    final rawData = await DatabaseHelper().getDPTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    dpData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${dpData.length}");
    setState(() {}); // Update UI after data change
  }

          List<Map<String, dynamic>> wvemData = [];

  void wvemgetbyDate() async {
    final rawData = await DatabaseHelper().getWVEMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    wvemData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${wvemData.length}");
    setState(() {}); // Update UI after data change
  }
  
            List<Map<String, dynamic>> swmData = [];

  void swmgetbyDate() async {
    final rawData = await DatabaseHelper().getSWMTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    swmData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${swmData.length}");
    setState(() {}); // Update UI after data change
  }

              List<Map<String, dynamic>> lpoData = [];

  void lpogetbyDate() async {
    final rawData = await DatabaseHelper().getLPOTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    lpoData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${lpoData.length}");
    setState(() {}); // Update UI after data change
  }

                List<Map<String, dynamic>> fbaoData = [];

  void fbaogetbyDate() async {
    final rawData = await DatabaseHelper().getFBAOTaskByDate(
      _selectedDay.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    fbaoData =
        rawData.where((element) => seen.add(element['taskname'])).toList();

    print("Filtered SDATA LENGTH --> ${fbaoData.length}");
    setState(() {}); // Update UI after data change
  }

}





class TaskRow extends StatelessWidget {
  final String iconPath;
  final String taskName;

  const TaskRow({Key? key, required this.iconPath, required this.taskName})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Check Icon
              CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.blue,
                child: Icon(Icons.check, size: 18, color: AppColors.textWhite),
              ),

              // Task Info
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    children: [
                      Image.asset(
                        iconPath,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          taskName,
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
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
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Play Icon
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
  }
}
