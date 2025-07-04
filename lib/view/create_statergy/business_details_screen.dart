
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/model/statergy_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/statergy_controller.dart';
import '../../helper/loadingHelper.dart';
import '../../sqlite_database/sqlite_database_helper.dart';
import '../menu/stratergy_details/stratergy_list_screen.dart';

class BusinessDetailsScreen extends StatefulWidget {
  final StrategyInputModel businessInfo;

  BusinessDetailsScreen({super.key, required this.businessInfo});

  @override
  State<BusinessDetailsScreen> createState() => _BusinessDetailsScreenState();
}

class _BusinessDetailsScreenState extends State<BusinessDetailsScreen> {
  String selectedAudience = 'B2B';
  String selectedLocation = 'National';
  final seostatergyController = Get.find<StrategyController>();

  List<String> audienceOptions = ['Startup', 'B2B', 'B2C', 'Enterprises'];
  List locationOptions = ['Online', 'Retail', 'Wholesale'];
  List<String> audienceimage = [
    "assets/images/audience1.png",
    "assets/images/audience2.png",
    "assets/images/audience3.png",
    "assets/images/audience4.png",
  ];

  String? selectedBusinessCategory;

  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController websiteUrlController = TextEditingController();
  final TextEditingController aboutBrandController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController gmbController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();


  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Your Brand/Business Details",
          style: primaryFont(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            height: 18 / 15, // Flutter uses a multiplier for line height
            letterSpacing: -0.17,
          ),
        ),
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner

            // Business nam
            ksizedbox30,
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8), // Background color
                borderRadius: BorderRadius.circular(12), // Border radius
              ),
              //padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: businessNameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/icons/business_home.png',
                    height: 24,
                    width: 24,
                  ),
                  hintText: 'Your Brand name',
                  helperStyle: primaryFont(
                    color: Colors.grey.shade400.withOpacity(0.2),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 14.64 / 14,
                    // line-height divided by font-size
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
            ksizedbox10,
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
                  helperStyle: primaryFont(
                    color: Colors.grey.shade400.withOpacity(0.2),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 14.64 / 14,
                    // line-height divided by font-size
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
            ksizedbox10,
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8), // Background color
                borderRadius: BorderRadius.circular(12), // Border radius
              ),
              //padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: aboutBrandController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/icons/brand.png',
                    height: 24,
                    width: 24,
                  ),
                  hintText: 'About your brand short brief',
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

            const SizedBox(height: 16),

            // Business Category
            DropdownButtonFormField<String>(
              value: selectedBusinessCategory,
              decoration: InputDecoration(
                prefixIcon: Image.asset("assets/icons/Rectangle 24 (1).png"),
                hintText: 'Select your Business Category',
                hintStyle: primaryFont(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade400,
                  fontSize: 14,
                  height: 14.64 / 14,
                  letterSpacing: -0.13,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
              ),
              items:
                  ['Retail', 'Technology', 'Healthcare']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: primaryFont(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 14.64 / 14,
                              letterSpacing: -0.13,
                            ),
                          ),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedBusinessCategory = value;
                });
              },
            ),

            ksizedbox20,
            // Audience Type
            Text(
              "Business Type",
              style: primaryFont(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 14.64 / 14, // Flutter's `height` is a multiplier
                letterSpacing: -0.13,
              ),
            ),
            ksizedbox10,
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: audienceOptions.length,
                itemBuilder: (context, index) {
                  final audience = audienceOptions[index];
                  final image = audienceimage[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAudience = audience;
                      });
                    },
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
            Text(
              "BUsiness Market",
              style: primaryFont(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 14.64 / 14, // Flutter's `height` is a multiplier
                letterSpacing: -0.13,
              ),
            ),
            ksizedbox20,
            SizedBox(
              height: 48, // Adjusted slightly for visual balance
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: locationOptions.length,
                itemBuilder: (context, index) {
                  final loc = locationOptions[index];
                  final isSelected = selectedLocation == loc;
                  final imagePath = locationImageMap[loc] ?? 'no found';

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLocation = loc;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Selection indicator (check or outline)
                            Container(
                              margin: const EdgeInsets.only(right: 6),
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    isSelected
                                        ? AppColors.yellow
                                        : Colors.transparent,
                                border:
                                    isSelected
                                        ? null
                                        : Border.all(
                                          color: Colors.black,
                                          width: 1.2,
                                        ),
                              ),
                              child:
                                  isSelected
                                      ? const Icon(
                                        Icons.check,
                                        size: 12,
                                        color: Colors.white,
                                      )
                                      : null,
                            ),

                            // Location icon
                            Image.asset(imagePath, height: 24, width: 24),
                            const SizedBox(width: 6),

                            // Location text
                            Text(
                              locationOptions[index],
                              style: primaryFont(
                                fontWeight: FontWeight.w500,
                                // 400 weight
                                fontSize: 13,
                                height: 1.0,
                                // line-height: 100%
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

            const SizedBox(height: 16),
            TextField(
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
            // Goal
            // _dropdownField("Linkedin Url", "assets/icons/linked.png"),
            const SizedBox(height: 16),
            TextField(
              controller:facebookController ,
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            "assets/icons/facebook.png",
            width: 24,
            height: 24,
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

            const SizedBox(height: 16),
                TextField(
                  controller: gmbController,
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            "assets/icons/gmb.png",
            width: 24,
            height: 24,
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
            // Duration
        
            const SizedBox(height: 16),
               TextField(
                 controller: instagramController,
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            "assets/icons/instagram.png",
            width: 24,
            height: 24,
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
            // Duration
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: InkWell(
          onTap: () async {


            LoadingHelper.show(context);


            final model = StrategyInputModel(
              businessName: businessNameController.text,
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
            // if (businessNameController.text.isEmpty ||
            //     websiteUrlController.text.isEmpty ||
            //     aboutBrandController.text.isEmpty ||
            //     selectedBusinessCategory == null) {
            //   Get.snackbar(
            //     "Missing Fields",
            //     "Please fill all required fields.",
            //   );
            //   return;
            // }

            // final model = StrategyInputModel(
            //   businessName: businessNameController.text,
            //   websiteUrl: websiteUrlController.text,
            //   aboutBrand: aboutBrandController.text,
            //   businessCategory: selectedBusinessCategory!,
            //   audienceType: selectedAudience,
            //   targetLocation: selectedLocation,
            //   linkedinUrl: linkedinController.text,
            //   facebookUrl: facebookController.text,
            //   gmbUrl: gmbController.text,
            //   instagramUrl: instagramController.text,
            // );
            //
            // // Save locally
            // await StrategyLocalStorage.saveBusinessInfo(model);
            // setState(() {
            //   loading = true;
            // });

            // Send to Gemini
          //  final response = await StrategyApiService().sendToGemini();


                   Get.to(StratergyListScreen());
              // Get.to(StratergyTaskScreen());


            // if (response != null) {
            //   setState(() {
            //     loading = false;
            //   });
            //   Get.to(StratergyTaskScreen());
            //   // Get.to(() => StrategyResponseScreen(response: response));
            // } else {
            //   setState(() {
            //     loading = false;
            //   });
            //   Get.snackbar("Error", "Gemini API failed. Try again.");
            // }

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
                        "Submit Now",
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

  Widget _audienceType(
    String label,
    String imagePath, {
    required bool selected,
  }) {
    return Container(
      width: 100,
      height: 81,
      decoration: BoxDecoration(
        color: selected ? AppColors.blue : Color(0xFFF8F8F8),
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
                    // 400 weight
                    fontSize: 13,
                    height: 1.0,
                    // 100% line-height
                    letterSpacing: -0.13,
                    color: selected ? AppColors.textWhite : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          if (selected)
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellow,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 10,
                    color: AppColors.textWhite,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _dropdownField(String hint, String image) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      // Add horizontal padding
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            // Adjust spacing inside the icon
            child: Image.asset(image, height: 20, width: 20),
          ),
          hintText: hint,
          hintStyle: primaryFont(
            color: Colors.grey.shade400.withOpacity(0.1),
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 14.64 / 14,
            letterSpacing: -0.13,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
        items:
            [
              'Option 1',
              'Option 2',
              'Option 3',
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (_) {},
      ),
    );
  }

  final Map<String, String> locationImageMap = {
    'Local': 'assets/icons/online.png',
    'Retail': 'assets/icons/rrr.png',
    'WholeSale': 'assets/icons/wholesale.png',
  };



}
