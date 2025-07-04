import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:digital_marketing_stratergy/view/menu/stratergy_details/stratery_selection_list.dart';
import 'package:flutter/material.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> sData = [];
  DateTime selectedDate = DateTime.now();

  void getbyDate() async {
    final rawData = await DatabaseHelper().getSeoTaskByDate(
        selectedDate.toString().split(" ")[0]);

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    sData = rawData
        .where((element) => seen.add(element['taskname']))
        .toList();

    setState(() {});
  }
  bool loading = false;
  @override
  void initState() {
    super.initState();
    getbyDate();
  }

  @override
  Widget build(BuildContext context) {
    final completedTasks =
    sData.where((task) => task["iscompleted"].toString() == '1').toList();


    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "XYZ Business",
              style: primaryFont(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                height: 1.2,
                letterSpacing: -0.17,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
              size: 20,
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildCalendarCard(),
            const SizedBox(height: 20),
            Row(
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
            const SizedBox(height: 20),

            /// ✅ Completed Tasks Section
            completedTasks.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: completedTasks.length,
                    itemBuilder: (context, index) {
                      final task = completedTasks[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, top: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: AppColors.blue,
                                  child: Icon(
                                    Icons.check,
                                    size: 18,
                                    color: AppColors.textWhite,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons/anlysis.png",
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        task["taskname"],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.yellow[700],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          "20XP",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
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
                    },
                  )
                : const Text("No Completed Tasks"),
            const SizedBox(height: 24),
            _buildDailyProgressCard(),
            const SizedBox(height: 24),
            _buildTaskCategories(),
            const SizedBox(height: 12),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        mini: true, // reduces size
        elevation: 1,
        onPressed: (){
          Get.to(StrategySelectionListScreen());
        },
        child: Icon(Icons.add,color: AppColors.textWhite,),
        tooltip: 'Add',
      ),
    );
  }


Widget _buildCalendarCard() {
  return GestureDetector(
    onTap: () async {
      // final DateTime? pickedDate = await showDatePicker(
      //   context: context,
      //   initialDate: selectedDate,
      //   firstDate: DateTime(2000),
      //   lastDate: DateTime(2100),
      // );
      // if (pickedDate != null) {
      //   setState(() {
      //     selectedDate = pickedDate;
      //   });
      //    getbyDate();
      // }
    },
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F1FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/icons/Rectangle 21.png", height: 36),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Calendar",
                    style: primaryFont(
                      fontWeight: FontWeight.w300,
                      fontSize: 11,
                      height: 1.8,
                      letterSpacing: -0.17,
                      color: const Color(0xFF7D7D7D),
                    ),
                  ),
                  Text(
                    "${selectedDate.day.toString().padLeft(2, '0')}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.year}, ${_weekdayName(selectedDate.weekday)}",
                    style: primaryFont(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      height: 1.2,
                      letterSpacing: -0.17,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.grey,
            size: 20,
          ),
        ],
      ),
    ),
  );
}

String _weekdayName(int weekday) {
  const weekdays = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];
  return weekdays[weekday - 1];
}






  Widget _buildDailyProgressCard() {
  int completed = 5;
  int total = 14;
  double progress = completed / total;

  return Container(
    height: 130,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF2196F3),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Top Row: Icon + Info + XP
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/daily-task.png",
                  height: 50,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daily Tasks",
                      style: primaryFont(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.2,
                        height: 14.64 / 12.2,
                        letterSpacing: -0.13,
                        color: AppColors.textWhite,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "05/",
                              style: primaryFont(
                                fontWeight: FontWeight.w800,
                                fontSize: 35.59,
                                height: 1.0,
                                letterSpacing: -0.24,
                                color: AppColors.textWhite,
                              ),
                            ),
                            TextSpan(
                              text: "14",
                              style: primaryFont(
                                fontWeight: FontWeight.w200,
                                fontSize: 16.0,
                                height: 1.0,
                                letterSpacing: -0.24,
                                color: AppColors.textWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "125",
                  style: primaryFont(
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                    height: 1.0,
                    letterSpacing: -0.17,
                    color: AppColors.yellow,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 2,
                    width: 120,
                    color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "1875 XP",
                    style: primaryFont(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      height: 1.0,
                      letterSpacing: -0.17,
                      color: AppColors.textWhite,
                    ),
                  ),
                )
              ],
            )
          ],
        ),

        /// Progress Bar
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 13,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3), // Track color
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress, // e.g. 5/14
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}


Widget _buildTaskCategories() {
  final categories = [
    {"title": "GMB", "icon": "assets/icons/gmb.png", "color": Colors.red},
    {"title": "SEO", "icon": "assets/icons/anlysis.png", "color": Colors.blue},
    {"title": "Influencer", "icon": "assets/icons/infulcer.png", "color": Colors.purple},
    {"title": "Performance", "icon": "assets/icons/performance.png", "color": Colors.green},
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Task Categories",
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
      const SizedBox(height: 12),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categories.map((cat) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Image.asset(
                      
                      cat["icon"] as String,
                      fit: BoxFit.contain,
                      height: 60,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                cat["title"] as String,
                style: primaryFont(
                  fontWeight: FontWeight.w500,
  fontSize: 13,
  height: 1.0, // 100% line-height
  letterSpacing: -0.13,
  // textAlign is set on the Text widget, not in TextStyle
                ),
              ),
            ],
          );
        }).toList(),
      ),
    ],
  );
}

}
