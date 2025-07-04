import 'dart:convert';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class PublishScreen extends StatefulWidget {
  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  List<TaskItem> tasks = [
    TaskItem("Google My Business", true,"",""),
    TaskItem("Instagram", false,"",""),
    TaskItem("Facebook", false,"",""),
    TaskItem("Linkedin", false,"",""),
    TaskItem("Whatsapp", false,"",""),
    TaskItem("Twitter X", false,"",""),
    TaskItem("Threads", false,"",""),
  ];

  List image = [
    "assets/icons/google.png",
    "assets/icons/instagram.png",
    "assets/icons/facebook.png",
    "assets/icons/linked.png",
    "assets/icons/whatsapp.png",
    "assets/icons/twiter.png",
    "assets/icons/threads.png",
  ];

  // String _status = 'Not authenticated';
  // final String locationId = 'YOUR_LOCATION_ID'; // Replace with real Location ID

  // Future<void> authenticateAndPost() async {
  //   setState(() {
  //     _status = 'Authenticating...';
  //   });

  //   final oauthHelper = GoogleBusinessAuth.getHelper();
  //   final token = await oauthHelper.getToken();

  //   if (token != null && token.accessToken != null) {
  //     setState(() {
  //       _status = 'Authenticated. Posting...';
  //     });

  //     await postToGoogleBusiness(token.accessToken!, locationId);

  //     setState(() {
  //       _status = 'Post done.';
  //     });
  //   } else {
  //     setState(() {
  //       _status = 'Authentication failed.';
  //     });
  //   }
  // }

  String AccessToken = "";




  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/business.manage',
    ],
    // 👇 THIS is very important: Use Web client ID from Google Cloud Console
    clientId: '913532453798-s7f9m274ua7fk2u4aqsdmjd35v26fr27.apps.googleusercontent.com',
  );

  Future<String?> getAccessToken() async {
    try {
      final account = await _googleSignIn.signIn();
      final auth = await account?.authentication;

      final accessToken = auth?.accessToken;
      print("Access Token: $accessToken");

      getAccountId(accessToken!);

      return accessToken;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  Future<String?> getAccountId(String accessToken) async {
    final response = await http.get(
      Uri.parse('https://businessprofile.googleapis.com/v1/accounts'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['accounts'] != null && data['accounts'].isNotEmpty) {
        print("Account Id: ${data['accounts'][0]['name']}");
        return data['accounts'][0]['name']; // e.g., accounts/123456789

      }
    } else {
      print('Failed to get account ID: ${response.body}');
    }

    return null;
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
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Row(
          children: [
            Text(
              "Publish Now",
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
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return InkWell(onTap: () {}, child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: _buildTaskTile(index),
                  ));
                },
              ),
            ],
          ),
          ksizedbox40,
          ksizedbox40,
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: InkWell(
              onTap: (){
                getAccessToken();

              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Publish Now",
                    style: primaryFont(
                        fontWeight: FontWeight.w500, // Equivalent to 500
                        fontSize: 15,
                        height: 18 / 15, // line-height of 18px with 15px font-size
                        letterSpacing: -0.17,
                        color: AppColors.textWhite
                    ),),
                ),
              ),
            ),
          ),
          ksizedbox20,
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: InkWell(
              onTap: (){
                showDateTimeBottomSheet(context);
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Schedule for Later",
                    style: primaryFont(
                      fontWeight: FontWeight.w500, // Equivalent to 500
                      fontSize: 15,
                      height: 18 / 15, // line-height of 18px with 15px font-size
                      letterSpacing: -0.17,

                    ),),
                ),
              ),
            ),
          ),
        ],

      ),
    );
  }


  void showDateTimeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        int selectedDay = 29;
        int selectedMonth = 5;
        int selectedYear = 2025;
        int selectedHour = 16;
        int selectedMinute = 30;

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Select Date & Time",
                    style: primaryFont(
                      fontSize: 18,
                      height: 1.0, // line-height: 100% means height = 1.0
                      letterSpacing: -0.13,
                      fontWeight: FontWeight.w700,

                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton<int>(
                        value: selectedDay,
                        items: List.generate(
                          31,
                              (index) => DropdownMenuItem(
                            child: Text("${index + 1}",
                              style: primaryFont(
                                fontWeight: FontWeight.w500,
                                fontSize: 19.81,
                                height: 1.0,
                                letterSpacing: -0.18,
                              ),),
                            value: index + 1,
                          ),
                        ),
                        onChanged: (value) => setState(() => selectedDay = value!),
                      ),
                      DropdownButton<int>(
                        value: selectedMonth,
                        items: List.generate(
                          12,
                              (index) => DropdownMenuItem(
                            child: Text("${index + 1}".padLeft(2, '0'),
                                style: primaryFont(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19.81,
                                  height: 1.0,
                                  letterSpacing: -0.18,
                                )
                            ),
                            value: index + 1,
                          ),
                        ),
                        onChanged: (value) => setState(() => selectedMonth = value!),
                      ),
                      DropdownButton<int>(
                        value: selectedYear,
                        items: List.generate(
                          10,
                              (index) => DropdownMenuItem(
                            child: Text("${2025 + index}",
                                style: primaryFont(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19.81,
                                  height: 1.0,
                                  letterSpacing: -0.18,
                                )),
                            value: 2025 + index,
                          ),
                        ),
                        onChanged: (value) => setState(() => selectedYear = value!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton<int>(
                        value: selectedHour,
                        items: List.generate(
                          24,
                              (index) => DropdownMenuItem(
                            child: Text("${index.toString().padLeft(2, '0')} hrs",
                                style: primaryFont(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19.81,
                                  height: 1.0,
                                  letterSpacing: -0.18,
                                )),
                            value: index,
                          ),
                        ),
                        onChanged: (value) => setState(() => selectedHour = value!),
                      ),
                      DropdownButton<int>(
                        value: selectedMinute,
                        items: [0, 15, 30, 45].map((min) {
                          return DropdownMenuItem(
                            child: Text("${min.toString().padLeft(2, '0')} min",
                                style: primaryFont(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19.81,
                                  height: 1.0,
                                  letterSpacing: -0.18,
                                )),
                            value: min,
                          );
                        }).toList(),
                        onChanged: (value) => setState(() => selectedMinute = value!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      DateTime scheduledDateTime = DateTime(
                        selectedYear,
                        selectedMonth,
                        selectedDay,
                        selectedHour,
                        selectedMinute,
                      );
                      Navigator.pop(context);
                      // Do something with scheduledDateTime
                      print("Scheduled for: $scheduledDateTime");
                    },
                    child: Text("Schedule Now",
                      style: primaryFont(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          height: 1.2, // 18px line-height ÷ 15px font-size = 1.2
                          letterSpacing: -0.17,
                          color: AppColors.textWhite
                      ),),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


  Widget _buildProgressCard() {
    int completed = tasks.where((task) => task.isCompleted).length;

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkyellow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Completed Tasks",
            style: primaryFont(
              fontWeight: FontWeight.w300, // Equivalent to 300 weight
              fontSize: 12.2,
              height: 14.64 / 12.2, // line-height ÷ font-size = 1.2
              letterSpacing: -0.13,
              color: AppColors.textWhite,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: primaryFont(), // Base style
                  children: [
                    TextSpan(
                      text: "$completed",
                      style: primaryFont(
                        fontWeight: FontWeight.w800,
                        fontSize: 35.59,
                        height: 1.0, // 100% line height
                        letterSpacing: -0.24,
                        color:
                        AppColors
                            .textWhite, // You must define a color for TextSpan
                      ), // highlight completed count
                    ),
                    TextSpan(
                      text: " / ${tasks.length} Tasks",
                      style: primaryFont(
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                        height: 1.0,
                        letterSpacing: -0.24,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Earned",
                    style: primaryFont(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.2,
                      height:
                      14.64 /
                          12.2, // Converts to Flutter line height (≈ 1.2)
                      letterSpacing: -0.13,
                      color: AppColors.textWhite, // Always specify a color
                    ),
                  ),
                  Text(
                    "500XP",
                    style: primaryFont(
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      height: 1.0, // 100% line-height
                      letterSpacing: -0.17,
                      color: Color(0xFF531012),
                    ),

                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(5),
            value: completed / tasks.length,
            backgroundColor: Colors.white24,
            color: Color(0xFF531012),
            minHeight: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTile(int index) {
    final task = tasks[index];

    return ListTile(
      leading: Checkbox(
        shape: CircleBorder(),
        value: task.isCompleted,
        onChanged: (bool? newValue) {
          setState(() {
            tasks[index] = TaskItem(task.title, newValue ?? false,"","");
          });
        },
        activeColor: Colors.blue, // color when checked
      ),
      title: Row(
        children: [
          Image.asset(image[index],height: 40,fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              task.title,
              style: primaryFont(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                height: 18 / 15, // line-height / font-size = 18/15 = 1.2
                letterSpacing: -0.17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "20XP",
                style: primaryFont(
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  height: 1.0,
                  letterSpacing: -0.17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskItem {
  final String title;
  final String instructions;
  final bool isCompleted;
  final String uTubeLink;

  TaskItem(this.title, this.isCompleted,this.uTubeLink,this.instructions);
}