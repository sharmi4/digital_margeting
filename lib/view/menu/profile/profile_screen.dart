import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xFFF39F08)),
          ),

          // Main Content
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        // Top Bar
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 32),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,
                                          size: 18,
                                          color: AppColors.textWhite,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Your Profile",
                                        style: primaryFont(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                          height: 18.0 / 14.0,
                                          letterSpacing: -0.17,
                                          color: AppColors.textWhite,
                                        ),
                                      ),
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
                                          color: AppColors.textWhite,
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
                                          color: AppColors.textWhite,
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
                        const SizedBox(height: 100),

                        // Bottom Sheet
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 40),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                          
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10,right: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/stergery_details.png",
                                                height: 30,
                                                fit: BoxFit.fitHeight,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Text(
                                                  "Switch Strategies",
                                                  style: primaryFont(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height:
                                                        14.64 /
                                                        14, // Ensures exact line height
                                                    letterSpacing: -0.13,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.blue,
                                                    shape: BoxShape.circle
                                                  ),
                                                  child: Center(
                                                    child: Text("3",
                                                    style: primaryFont(
                                                      fontWeight: FontWeight.w400, // font-weight: 400
                                                    fontSize: 14,                // font-size: 14px
                                                    height: 14.64 / 14,          // line-height: 14.64px
                                                    letterSpacing: -0.13,  
                                                    color: AppColors.textWhite      // letter-spacing: -0.13px
                                                    ),),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Icon(Icons.arrow_forward_ios,
                                          color: AppColors.grey,)
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Add profile details here
                                  ksizedbox40,
                                  buildInfoRow(label: "Full Name", value: "Johnson Doe"),
                                  ksizedbox10,
            buildInfoRow(label: "eMail ID", value: "johnsondoe@xymail.com"),
            ksizedbox10,
            buildInfoRow(label: "Password", value: "*********", isEditable: true),
            ksizedbox10,
            buildInfoRow(label: "Date of Birth", value: "08.04.1990"),
            ksizedbox10,
            buildInfoRow(label: "Mobile Number", value: "+91 90000 9000", isEditable: true),
            ksizedbox10,
            buildInfoRow(label: "Brand Name", value: "XYZ Business", isEditable: true),
            ksizedbox10,
            buildInfoRow(label: "Brand Website", value: "www.xyz.com", isEditable: true),

            ksizedbox40,
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text("Log Out",
                style: primaryFont(
                  fontWeight: FontWeight.w500,
  fontSize: 15,
  height: 18 / 15, // line-height ÷ font-size
  letterSpacing: -0.17,
  color: AppColors.textWhite
                ),),
              ),
            )

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Profile Card Positioned
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/Ellipse 1 (1).png",
                      height: 130,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  

    Widget buildInfoRow({
    required String label,
    required String value,
    bool isEditable = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Albert Sans',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 14.64 / 14,
                letterSpacing: -0.13,
                color: Colors.black87,
              ),
            ),
          ),
          const Text(" : "),
          const SizedBox(width: 4),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: primaryFont(
                      
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 14.64 / 14,
                      letterSpacing: -0.13,
                      color: Colors.black,
                    ),
                  ),
                ),
                if (isEditable)
                  Icon(
                    Icons.edit,
                    size: 16,
                    color: Colors.grey,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

