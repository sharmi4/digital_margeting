import 'package:digital_marketing_stratergy/Helper.dart';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/helper/loadingHelper.dart';
import 'package:digital_marketing_stratergy/model/statergy_model.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/stratergy_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sqlite_database/sqlite_database_helper.dart';

class StrategySelectionScreen extends StatefulWidget {
  const StrategySelectionScreen({super.key});

  @override
  State<StrategySelectionScreen> createState() =>
      _StrategySelectionScreenState();
}

class _StrategySelectionScreenState extends State<StrategySelectionScreen> {
  String selectedAudience = 'B2B';
  String selectedLocation = 'National';

  String? selectedGoal;
  String? selectedBusinessCategory;
  String? selectduration;

  final businessnameController = TextEditingController();
    final TextEditingController websiteUrlController = TextEditingController();
  final TextEditingController aboutBrandController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController gmbController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();

  final List<String> audienceOptions = ['Startup', 'B2B', 'B2C', 'Enterprises'];
  final List<String> locationOptions = ['Local', 'National', 'International'];
  final List<String> audienceimage = [
    "assets/images/audience1.png",
    "assets/images/audience2.png",
    "assets/images/audience3.png",
    "assets/images/audience4.png",
  ];

  final Map<String, String> locationImageMap = {
    'Local': 'assets/icons/local.png',
    'National': 'assets/icons/national.png',
    'International': 'assets/icons/international.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Create New Digital Marketing Strategy",
          style: primaryFont(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            height: 18 / 15,
            letterSpacing: -0.17,
            color: Colors.black,
          ),
        ),
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              width: double.infinity,
              height: 93,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.darkblue,
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/pitch_perfet.png"),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Pitch Perfect',
                          style: primaryFont(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            height: 15 / 18,
                            letterSpacing: -0.13,
                            color: AppColors.textWhite,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Marketing is just flirting with data,\ncharm them till they convert!',
                            style: primaryFont(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.2,
                              height: 14.64 / 12.2,
                              letterSpacing: -0.13,
                              color: AppColors.textWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Business name
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: businessnameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  prefixIcon: Image.asset('assets/icons/business_home.png'),
                  hintText: 'Enter your Business name',
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
            const SizedBox(height: 16),
              Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8), // Background color
                borderRadius: BorderRadius.circular(12), // Border radius
              ),
              //padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: websiteUrlController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/icons/website.png',
                    height: 24,
                    width: 24,
                  ),
                  hintText: 'Your Website Url',
                  hintStyle: primaryFont(
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
                       const SizedBox(height: 16),
            Container(
  decoration: BoxDecoration(
    color: const Color(0xFFF8F8F8),
    borderRadius: BorderRadius.circular(12),
  ),
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Optional padding
  child: TextField(
    controller: aboutBrandController,
    textCapitalization: TextCapitalization.words,
    maxLines: null, // <-- Allows dynamic height
    //minLines: 3,    // <-- Sets minimum height
    style: primaryFont(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    decoration: InputDecoration(
      prefixIcon: Image.asset(
        'assets/icons/brand.png',
        height: 24,
        width: 24,
      ),
      hintText: 'About your brand short brief',
      hintStyle: primaryFont(
        color: Colors.grey.shade400,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 14.64 / 14,
        letterSpacing: -0.13,
      ),
      isCollapsed: false,
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    ),
  ),
),


            const SizedBox(height: 16),

            // Business Category
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonFormField<String>(
                value: selectedBusinessCategory,
                decoration: InputDecoration(
                  prefixIcon:
                      Image.asset("assets/icons/Rectangle 24 (1).png"),
                  hintText: 'Select your Business Category',
                  hintStyle: primaryFont(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 14.64 / 14,
                    letterSpacing: -0.13,
                  ),
                  border: InputBorder.none,
                ),
                items: [
                  'Real estate',
                  'Consumer goods',
                  'Software development',
                  "Dental clinic",
                  "Multi speciality clinic"
                ]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e,
                              style: primaryFont(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
                        ))
                    .toList(),
                onChanged: (value) =>
                    setState(() => selectedBusinessCategory = value),
              ),
            ),

            const SizedBox(height: 20),

            // Audience Type
            Text("Audience Type",
                style: primaryFont(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1.05,
                    letterSpacing: -0.13)),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: audienceOptions.length,
                itemBuilder: (context, index) {
                  final audience = audienceOptions[index];
                  final image = audienceimage[index];
                  return GestureDetector(
                    onTap: () => setState(() => selectedAudience = audience),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _audienceType(
                        audience,
                        image,
                        selected: selectedAudience == audience,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Target Location
            Text("Target Location",
                style: primaryFont(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1.05,
                    letterSpacing: -0.13)),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: locationOptions.length,
                itemBuilder: (context, index) {
                  final loc = locationOptions[index];
                  final isSelected = selectedLocation == loc;
                  final imagePath =
                      locationImageMap[loc] ?? 'assets/icons/default.png';
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () => setState(() => selectedLocation = loc),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 6),
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? AppColors.yellow
                                    : Colors.transparent,
                                border: isSelected
                                    ? null
                                    : Border.all(
                                        color: Colors.black, width: 1.2),
                              ),
                              child: isSelected
                                  ? const Icon(Icons.check,
                                      size: 12, color: Colors.white)
                                  : null,
                            ),
                            Image.asset(imagePath, height: 24, width: 24),
                            const SizedBox(width: 6),
                            Text(
                              loc,
                              style: primaryFont(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                height: 1.0,
                                letterSpacing: -0.13,
                                color:
                                    isSelected ? Colors.white : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Goal Dropdown
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: _dropdownField(
                hint: "Select your Goal",
                image: "assets/icons/goal.png",
                items: [
                  'Brand awareness',
                  'Lead generation',
                  'Generating traffic to website'
                ],
                selectedValue: selectedGoal,
                onChanged: (value) => setState(() => selectedGoal = value),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: _dropdownField(
                hint: "Stratergy Duration",
                image: "assets/icons/duration.png",
                items: [
                  '30 days',
                  '60 days',
                  '90 days'
                ],
                selectedValue: selectduration,
                onChanged: (value) {
      setState(() {
        selectduration = value!;
        Helper.duration = selectduration!;
        print(">>>>>>>>>>>>>>>>>SELECTED DURATION>>>>>>>>${Helper.duration}");
      });
    },
              ),
            ),



            const SizedBox(height: 16),
            
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                decoration: BoxDecoration(
                   color: const Color(0xFFF8F8F8),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(0.0, 0.75),
                      blurRadius: 1,
                      color: Colors.grey
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: linkedinController,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                "assets/icons/linked.png",
                width: 24,
                height: 24,
                          ),
                          hintText: "Linkedin Url",
                          hintStyle: primaryFont(
                 fontWeight: FontWeight.w500,     // Medium (500)
                    fontSize: 14,
                    height: 14.64 / 14,              // Flutter uses line-height as a multiplier
                    letterSpacing: -0.13,
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.transparent, // So container color shows
                          contentPadding: const EdgeInsets.symmetric(vertical: 14),
                          suffixIcon:  Icon(Icons.check_circle, color: Colors.lightBlueAccent)
                
                        ),
                      ),
              ),
            ),

            // Budget Dropdown
           

            const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Container(
                  decoration: BoxDecoration(
                     color: const Color(0xFFF8F8F8),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0.0, 0.75),
                        blurRadius: 1,
                        color: Colors.grey
                     )
                    ],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                  controller:facebookController ,
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              "assets/icons/facebook.png",
                              width: 40,
                              height: 40,
                            ),
                            hintText: "Facebook Url",
                            hintStyle: primaryFont(
                               fontWeight: FontWeight.w500,     // Medium (500)
                      fontSize: 14,
                      height: 14.64 / 14,              // Flutter uses line-height as a multiplier
                      letterSpacing: -0.13,
                            ),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.transparent, // So container color shows
                            contentPadding: const EdgeInsets.symmetric(vertical: 14),
                            suffixIcon:  Icon(Icons.check_circle, color: Colors.lightBlueAccent)
                              
                          ),
                        ),
                ),
              ),
            const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              decoration: BoxDecoration(
                 color: const Color(0xFFF8F8F8),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0.0, 0.75),
                    blurRadius: 1,
                    color: Colors.grey
                  )
                ],
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                      controller: gmbController,
                      decoration: InputDecoration(
              prefixIcon: Image.asset(
                "assets/icons/gmb.png",
                width: 40,
                height: 40,
              ),
              hintText: "GMB Url",
              hintStyle: primaryFont(
                 fontWeight: FontWeight.w500,     // Medium (500)
                  fontSize: 14,
                  height: 14.64 / 14,              // Flutter uses line-height as a multiplier
                  letterSpacing: -0.13,
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.transparent, // So container color shows
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              suffixIcon:  Icon(Icons.check_circle, color: Colors.lightBlueAccent)
                
                      ),
                    ),
            ),
          ),
         const SizedBox(height: 16),
       Padding(
         padding: const EdgeInsets.only(left: 10,right: 10),
         child: Container(
          decoration: BoxDecoration(
             color: const Color(0xFFF8F8F8),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0.0, 0.75),
                blurRadius: 1,
                color: Colors.grey
              )
            ],
            borderRadius: BorderRadius.circular(10)
          ),
           child: TextField(
                     controller: instagramController,
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                "assets/icons/instagram.png",
                width: 40,
                height: 40,
              ),
              hintText: "Instagram Url",
              hintStyle: primaryFont(
                 fontWeight: FontWeight.w500,     // Medium (500)
               fontSize: 14,
               height: 14.64 / 14,              // Flutter uses line-height as a multiplier
               letterSpacing: -0.13,
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.transparent, // So container color shows
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              suffixIcon:  Icon(Icons.check_circle, color: Colors.lightBlueAccent)
                
            ),
                 ),
         ),
       ),

            // Duration Dropdown
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: ()async {
            if (businessnameController.text.isEmpty ||
                selectedBusinessCategory == null ||
                selectedGoal == null) {
              Get.snackbar("Missing", "Please fill all required fields");
              return;
            }

            // Store selected data
            Helper.businessname = businessnameController.text;
            Helper.autiencetype = selectedAudience;
            Helper.businesscategoryselected = selectedBusinessCategory!;
            Helper.selectgoal = selectedGoal!;
            Helper.targetlocation = selectedLocation;
            Helper.duration = selectduration!;

            print(">>>>>>>>>>>>>>>>>SELECTED DURATION>>>>>>>>${Helper.duration}");

            LoadingHelper.show(context);


            final model = StrategyInputModel(
              businessName: businessnameController.text,
              websiteUrl: websiteUrlController.text,
              aboutBrand: aboutBrandController.text,
              businessCategory: selectedBusinessCategory!,
              audienceType: selectedAudience,
              targetLocation: selectedLocation,
              linkedinUrl: linkedinController.text,
              facebookUrl: facebookController.text,
              gmbUrl: gmbController.text,
              instagramUrl: instagramController.text,
            );
            await  DatabaseHelper().insertbusinessdata(model);
            getBusinessTable(); // Wait for the table to be fetched
            Future.delayed(Duration(milliseconds: 200), () {
              Get.to(StratergyTaskScreen());
              });

          
               
            
              
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Create Digital Marketing Strategy Now",
                style: primaryFont(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  height: 1.2,
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

  void getBusinessTable ()async{
    List<Map<String,dynamic>> data = await DatabaseHelper().getbusinessdata();
    
    if(data.isNotEmpty && data.length == 1){
      Helper.businessId = data[0]["id"].toString();
      print(">>>>>>>>>>>>>>>BusinessId>>>>>>>${Helper.businessId}");
    }else if(data.isNotEmpty && data.length > 1){
      Helper.businessId = data[data.length -1]["id"].toString();
      print(">>>>>>>>>>>>>>>else if BusinessId>>>>>>>${Helper.businessId}");
    }
  }

  Widget _audienceType(
    String label,
    String imagePath, {
    required bool selected,
  }) {
    return Container(
      width: 100,
      height: 81,
      decoration: BoxDecoration(
        color: selected ? AppColors.blue : const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath, height: 47, width: 47),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: primaryFont(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    height: 1.0,
                    letterSpacing: -0.13,
                    color: selected ? AppColors.textWhite : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? AppColors.yellow : Colors.transparent,
                border: selected
                    ? null
                    : Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: selected
                  ? const Center(
                      child: Icon(Icons.check,
                          size: 10, color: AppColors.textWhite),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdownField({
    required String hint,
    required String image,
    required List<String> items,
    required String? selectedValue,
    required void Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0.0, 0.75),
            blurRadius: 1,
            color: Colors.grey
          )
        ]
      ),
      
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          prefixIcon: Image.asset(image, height: 30, width: 30),
          hintText: hint,
          hintStyle: primaryFont(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 14.64 / 14,
            letterSpacing: -0.13,
          ),
          border: InputBorder.none,
        ),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
