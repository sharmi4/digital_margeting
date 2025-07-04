import 'package:digital_marketing_stratergy/Helper.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/stratergy_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/app_color.dart';
import '../../../controller/statergy_controller.dart';
import 'stratery_selection_list.dart';

class StratergyListScreen extends StatefulWidget {
  const StratergyListScreen({super.key});

  @override
  State<StratergyListScreen> createState() => _StratergyListScreenState();
}

class _StratergyListScreenState extends State<StratergyListScreen> {
  bool loading = false;

  List getbusinesstask = [];

  final seostatergyController = Get.find<StrategyController>();

  getbusinessdatadb() async {
    getbusinesstask = await DatabaseHelper().getbusinessdata();
    print(">>>>>>>>>>>>getseoTask>>>>>>>${getbusinesstask.length}");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getbusinessdatadb();
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
          child: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Row(
          children: [
            Text(
              "Strategy List",
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
      body: Column(
        children: [
          ListView.builder(
            itemCount: getbusinesstask.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: GestureDetector(
                  onTap: () {
                    final id = getbusinesstask[index]["id"];
                    print(":::::::::::::::businessId ${id}");
                    if (id != null && id.toString().isNotEmpty) {
                      Helper.businessId = id.toString();
                      print("business list Id: ${Helper.businessId}");
                      Get.to(StratergyTaskScreen());
                    } else {
                      print("⚠️ Missing business ID at index $index");
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 1,
                          offset: Offset(0.0, 0.75),
                          color: Colors.grey,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getbusinesstask[index]["businessName"],
                            style: primaryFont(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              height: 1.2, // same as 18 / 15
                              letterSpacing: -0.17,
                            ),

                            //maxLines: 1, // or 2/3 if wrapping is okay
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: InkWell(
                                  onTap: () {
                                    // _launchUrl(Helper.item[index].uTubeLink);
                                  },
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: const Color(0xFFE6F1FF),
                                    child: Icon(
                                      Icons.play_arrow_sharp,
                                      size: 25,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: InkWell(
                                  onTap: () async {
                                    final item = getbusinesstask[index];
                                    final businessId = item['id'];
                                    print(
                                      'Tapped index: $index, Deleting business ID: $businessId',
                                    );

                                    if (businessId != null &&
                                        businessId.toString().isNotEmpty) {
                                      await DatabaseHelper().deleteBusinessdata(
                                        int.parse(businessId.toString()),
                                      ); // await it!
                                      await getbusinessdatadb(); // refresh after deletion
                                    } else {
                                      print(
                                        "⚠️ Invalid business ID for deletion.",
                                      );
                                    }
                                  },

                                  child: Icon(Icons.delete, color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: InkWell(
          onTap: () async {
            Get.to(StrategySelectionListScreen());
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child:
                  loading == false
                      ? Text(
                        "Create New Strategy",
                        style: primaryFont(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.0,
                          height: 18 / 15,
                          letterSpacing: -0.17,
                          color: AppColors.textWhite,
                        ),
                      )
                      : CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
