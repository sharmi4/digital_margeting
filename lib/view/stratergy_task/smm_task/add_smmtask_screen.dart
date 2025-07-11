
import 'package:digital_marketing_stratergy/Helper.dart';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/model/seo_database_taskmodel.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/particular_stratergy_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'smm_stratergy_screen.dart';


class AddSmmTaskScreen extends StatefulWidget {
  const AddSmmTaskScreen({super.key});

  @override
  State<AddSmmTaskScreen> createState() => _AddSmmTaskScreenState();
}

class _AddSmmTaskScreenState extends State<AddSmmTaskScreen> {
  var tasknameController = TextEditingController();
  var youtubeUrlController = TextEditingController();
  var instructionController = TextEditingController();
      bool loading = false;
      DateTime? selectedDate;

    List smmgettask = [];

  gettaskdb() async {
    smmgettask = await DatabaseHelper().getSMMdata();
    print(">>>>>>>>>>>>getseoTask>>>>>>>${smmgettask.length}");
    setState(()  {

    });
  }  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Create New Task",
          style: primaryFont(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            height: 18 / 15,
            letterSpacing: -0.17,
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 1,
                        color: Colors.grey
                      )
                    ]
                  ),
                  child: TextField(
                    controller:tasknameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/icons/business_home.png'),
                      hintText: 'Enter your Task name',
                      hintStyle: primaryFont(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 14.64 / 14,
                        letterSpacing: -0.13,
                      ),
                      suffixIcon: Icon(Icons.check_circle_sharp,
                          size: 30,
                          color: AppColors.lightblue.withOpacity(0.3)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              Padding(
  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
  child: GestureDetector(
    onTap: () async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (pickedDate != null) {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0.0, 0.75),
            blurRadius: 1,
            color: Colors.grey,
          )
        ],
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          prefixIcon: Image.asset("assets/icons/Rectangle 24 (1).png"),
          border: InputBorder.none,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            selectedDate != null
                ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                : 'Select a Date',
            style: primaryFont(
              color: selectedDate != null
                  ? Colors.black
                  : Colors.grey.shade400,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 14.64 / 14,
              letterSpacing: -0.13,
            ),
          ),
        ),
      ),
    ),
  ),
),

                ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8F8F8), // Background color
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 1,
                            color: Colors.grey
                          )
                        ] // Border radius
                                  ),
                                  //padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: TextField(
                                    controller: instructionController,
                                    textCapitalization: TextCapitalization.words,
                                    decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/icons/brand.png',
                      height: 24,
                      width: 24,
                    ),
                    hintText: 'Enter Instruction',
                    helperStyle: primaryFont(
                      color: Colors.grey.shade400.withOpacity(0.2),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 14.64 / 14,
                      // line-height divided by font-size
                      letterSpacing: -0.13,
                    ),
                    
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                  ),
                ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8F8F8), // Background color
                                    borderRadius: BorderRadius.circular(12), // Border radius
                                    boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(0.0, 0.75),
                          blurRadius: 1,
                          color: Colors.grey
                        )
                      ]
                                  ),
                                  //padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: TextField(
                                    controller: youtubeUrlController,
                                    textCapitalization: TextCapitalization.words,
                                    decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/icons/website.png',
                      height: 24,
                      width: 24,
                    ),
                    hintText: 'Your Youtube Url',
                    helperStyle: primaryFont(
                      
                      color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 14.64 / 14,
                        letterSpacing: -0.13,
                    ),
                    suffixIcon: Icon(
                      Icons.check_circle_sharp,
                      size: 30,
                      color: AppColors.lightblue.withOpacity(0.3),
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                  ),
          ],
        ),
      ),
        bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: InkWell(
          onTap: () async {

           final addTask = SeoTaskModel(
      taskname: tasknameController.text,
      snumber: smmgettask.length+1,
      insturctions: instructionController.text,
      iscompleted:0, date: selectedDate.toString(), 
      type: "Manual", businessId: Helper.businessId,
    );
     await DatabaseHelper().insertSMMtaskdata(addTask);
      Get.to(SmmStrategyScreen(businessId: Helper.businessId,));

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
                  loading == false?
                     Text(
                        "Add Task",
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