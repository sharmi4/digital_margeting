import 'package:digital_marketing_stratergy/view/calender/publish_screen.dart';
import 'package:flutter/material.dart';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:get/get.dart';

import '../../Helper.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  String description = Helper.content[0].description;
  String title = Helper.content[0].titles;
  String hashtags = Helper.content[0].hashtags.toString().replaceAll("[", "").replaceAll("]", "");

  bool isEditing = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: description);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void regenerateContent() {
    setState(() {
     // description = '🔧 Happy Workers’ Day!\nThanks to all who contribute to a stronger, better world.\n#LabourDay #RespectWorkers #YourBusinessName';
      _controller.text = description;
      print("DESCRIPTION ---> ${description}");
    });
  }

  void publishContent() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Post Published Successfully!")),
    );
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Generate Post Details",
          style: primaryFont(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            height: 1.2,
            letterSpacing: -0.17,
          ),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.yellow.withOpacity(0.1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/generate_post_image.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              isEditing
                  ? TextField(
                    controller: _controller,
                    maxLines: null,
                    style: primaryFont(fontSize: 14),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.yellow[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      description = value;
                    },
                  )
                  : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: primaryFont(
                            fontWeight: FontWeight.w400, // equivalent to weight 300
                            fontSize: 14,
                            height: 1.5, // line-height 100%
                            letterSpacing: -0.13,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          description,
                          style: primaryFont(
                            fontWeight: FontWeight.w400, // equivalent to weight 300
                            fontSize: 14,
                            height: 1.5, // line-height 100%
                            letterSpacing: -0.13,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Text(
                          hashtags,
                          style: primaryFont(
                            fontWeight: FontWeight.w400, // equivalent to weight 300
                            fontSize: 14,
                            height: 1.5, // line-height 100%
                            letterSpacing: -0.13,
                          ),
                        ),
                      ],
                    ),
                  ),
              ksizedbox20,
              Text(
                "Would you like to customize it or Post this \ncontent on uploading?",
                textAlign: TextAlign.center,
                style: primaryFont(
                  fontWeight: FontWeight.w400, // 300 weight
                  fontSize: 14, // 12px
                  height: 1.2, // 100% line-height
                  letterSpacing: -0.13, // -0.13px
                ),
              ),
              ksizedbox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      regenerateContent;
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Regenerate",
                          style: primaryFont(
                            fontWeight: FontWeight.w300,
                            // 300 weight = Light
                            fontSize: 13,
                            // 12px
                            height: 1.0,
                            // 100% line-height
                            letterSpacing: -0.13,
                            // -0.13px
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isEditing = !isEditing;
                        if (!isEditing) {
                          description = _controller.text;
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Edit",
                          style: primaryFont(
                            fontWeight: FontWeight.w300,
                            // 300 weight = Light
                            fontSize: 13,
                            // 12px
                            height: 1.0,
                            // 100% line-height
                            letterSpacing: -0.13,
                            // -0.13px
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: InkWell(
          onTap: () {
            Get.to(PublishScreen());
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
                "Publish Now",
                style: primaryFont(
                  fontWeight: FontWeight.w500,
                  // Equivalent to 500
                  fontSize: 15,
                  height: 18 / 15,
                  // line-height of 18px with 15px font-size
                  letterSpacing: -0.17,
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
