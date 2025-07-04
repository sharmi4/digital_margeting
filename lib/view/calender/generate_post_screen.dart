import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/view/calender/post_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GeneratePostImageScreen extends StatefulWidget {
  const GeneratePostImageScreen({super.key});

  @override
  State<GeneratePostImageScreen> createState() => _GeneratePostImageScreenState();
}

class _GeneratePostImageScreenState extends State<GeneratePostImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading:InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new_outlined)),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.yellow.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/generate_post_image.png', // Replace with your asset path or network image
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(18)
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/Refresh.svg",
                    height: 15,
                    fit: BoxFit.cover,
                    color: AppColors.blue,),
                     Padding(
                       padding: const EdgeInsets.only(left: 3),
                       child: Text('Regenerate Image',
                                     style: primaryFont(
                                       fontWeight: FontWeight.w600,
                           fontSize: 13,
                           height: 1.0, // 100% line height
                           letterSpacing: -0.17,
                           color: AppColors.blue
                                     ),
                                     ),
                     ),
                  ],
                ),
              ),
            ),
              const SizedBox(height: 24),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(18)
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.download,
                  color: AppColors.blue,),
                     Padding(
                       padding: const EdgeInsets.only(left: 3),
                       child: Text('Save Image',
                                     style: primaryFont(
                                       fontWeight: FontWeight.w600,
                           fontSize: 13,
                           height: 1.0, // 100% line height
                           letterSpacing: -0.17,
                           color: AppColors.blue
                                     ),
                                     ),
                     ),
                  ],
                ),
              ),
            ),

            const Spacer(),
            InkWell(
                onTap: () {
                  Get.to(PostDetailsScreen());
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Generate Post Details",
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
          ],
        ),
      ),
    );
  }
}
