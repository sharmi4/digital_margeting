import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/model/seo_database_taskmodel.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/add_task/add_task_screen.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/particular_task_progress.dart'show ParticulartaskProgressScreen;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Helper.dart';

class SeoStrategyScreen extends StatefulWidget {

   final String businessId; // <-- argument

  SeoStrategyScreen({required this.businessId}); // <-- constructor
  @override
  State<SeoStrategyScreen> createState() => _SeoStrategyScreenState();
}

class _SeoStrategyScreenState extends State<SeoStrategyScreen> {
 
  @override
  void initState() {
    // TODO: implement initState
    gettaskdb();
    super.initState();
  }

  List seogettask = [];

  gettaskdb() async {
    seogettask = await DatabaseHelper().getSeoTaskById(Helper.businessId);
    print(">>>>>>>>>>>>getseoTask>>>>>>>${seogettask.length}");
    print(">>>>>>>>>>>>>>>>>>businessId${Helper.businessId}");
    setState(()  {

    });
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
              "SEO Strategy",
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
              _buildProgressCard(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Daily Tasks",
                  style: primaryFont(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    height: 14.64 / 14,
                    // ≈ 1.046
                    letterSpacing: -0.13,
                    color: Colors.black, // Always specify a color
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: seogettask.length,
                itemBuilder: (context, index) {
                  return _buildTaskTile(index);
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
         mini: true, // reduces size
        elevation: 1,
        onPressed: (){
          Get.to(AddTaskScreen());
        },
        child: Icon(Icons.add,color: AppColors.textWhite,),
        tooltip: 'Add',
      ),
    );
  }

  Widget _buildProgressCard() {
    int completed = seogettask.where((task) => task["iscompleted"] == "1").length;


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
              fontWeight: FontWeight.w300,
              // Equivalent to 300 weight
              fontSize: 12.2,
              height: 14.64 / 12.2,
              // line-height ÷ font-size = 1.2
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
                        height: 1.0,
                        // 100% line height
                        letterSpacing: -0.24,
                        color:
                            AppColors
                                .textWhite, // You must define a color for TextSpan
                      ), // highlight completed count
                    ),
                    TextSpan(
  text: " / ${seogettask.length} Tasks",
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
                      height: 14.64 / 12.2,
                      // Converts to Flutter line height (≈ 1.2)
                      letterSpacing: -0.13,
                      color: AppColors.textWhite, // Always specify a color
                    ),
                  ),
                  Text(
                    "500XP",
                    style: primaryFont(
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      height: 1.0,
                      // 100% line-height
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
            value: 1.0,
            backgroundColor: Colors.white24,
            color: Color(0xFF531012),
            minHeight: 10,
          ),
        ],
      ),
    );
  }
  
  Widget _buildTaskTile(int index) {
    final task = seogettask[index];

    return ListTile(
      leading:  Text(
        '${index + 1}.',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),

      title: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                Helper.selectedstartergytitle = seogettask[index]["taskname"];
                Helper.taskId = seogettask[index]["id"].toString();
                      Helper.snumber = seogettask[index]["snumber"];
                      Helper.instrusction = seogettask[index]["insturctions"];
                      Helper.type = seogettask[index]["type"];

                      Get.to(
                        ParticulartaskProgressScreen(
                          instructions: Helper.instrusction, 
                          category: 'SEO', type: Helper.type,
                        ),
                      );
              },
              child: Text(
                seogettask[index]["taskname"],
                style: primaryFont(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  height: 1.2, // same as 18 / 15
                  letterSpacing: -0.17,
                ),
              
                //maxLines: 1, // or 2/3 if wrapping is okay
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
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: ()async {
              final task = SeoTaskModel.fromJson(seogettask[index]);
    
    TextEditingController nameController = TextEditingController(text: task.taskname);
    
    
  await showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: const Text("Edit Task"),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9, // 80% of screen width
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Task Name"),
              ),
              // Add more fields here if needed
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
           final updatedTask = SeoTaskModel(
            id: task.id,
      taskname: nameController.text,
      snumber: task.snumber,
      insturctions: task.insturctions,
      iscompleted: task.iscompleted, type: Helper.type, businessId: Helper.businessId,
    );

    await DatabaseHelper().updateseotask(updatedTask);

    await gettaskdb(); // ✅ refresh data from DB
    Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    );
  },
);

          },
          child: Icon(
            Icons.edit,
            color: AppColors.blue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: InkWell(
            onTap: () {
              _launchUrl(Helper.item[index].uTubeLink);
            },
            child: CircleAvatar(
              backgroundColor: const Color(0xFFE6F1FF),
              child: Icon(
                Icons.play_arrow_sharp,
                size: 25,
                color: AppColors.blue,
              ),
            ),
          ),
        ),
      ],
    ),

    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}

class TaskItem1 {
  final String title;
  final String instructions;
  final bool isCompleted;
  final String uTubeLink;

  TaskItem1(this.title, this.isCompleted, this.uTubeLink, this.instructions);
}
