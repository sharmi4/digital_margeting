import 'package:digital_marketing_stratergy/auth/auth_screen.dart' show AuthScreen;
import 'package:flutter/material.dart';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:get/get.dart';

// Dummy CustomTextField widget (replace with your actual implementation)
class CustomTextField extends StatelessWidget {
  final String icon;
  final String hintText;
  final bool isVerified;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 55,
      width: double.infinity, // Full width
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color
        borderRadius: BorderRadius.circular(12),
     
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            icon,
            width: 24,
            height: 24,
          ),
          hintText: hintText,
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
          suffixIcon: isVerified
              ? const Icon(Icons.check_circle, color: Colors.lightBlueAccent)
              : null,
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new, color: AppColors.textWhite)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "Go ahead and Change your password",
                style: primaryFont(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  height: 1.0,
                  letterSpacing: -0.17,
                  color: AppColors.textWhite,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Change Password to enjoy the best marketing experience",
                style: primaryFont(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  height: 1.05,
                  letterSpacing: -0.13,
                  color: AppColors.textWhite,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    _buildCustomToggle(),
                    const SizedBox(height: 20),
                    Flexible(
                      child: SingleChildScrollView(
                        child:
               _buildLoginForm()
                            
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomToggle() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildToggleItem("Forgot Password", 0),
        
        ],
      ),
    );
  }

  Widget _buildToggleItem(String title, int index) {
    

    return Expanded(
      child: InkWell(
        onTap: () {
          Get.to(AuthScreen());
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'AlbertSans',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomTextField(
          icon: "assets/images/email_icon.png",
          hintText: 'Email address',
          isVerified: true,
        ),
        const SizedBox(height: 10),
        const CustomTextField(
          icon: "assets/images/password_icon.png",
          hintText: 'Confirm Password',
          isVerified: true,
        ),
      
        const SizedBox(height: 60),
        _buildSubmitButton("Change password"),
      
      
      ],
    );
  }


  Widget _buildSubmitButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            // Handle login/register logic
          },
          child: Text(
            title,
            style: primaryFont(
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
              height: 1.2,
              letterSpacing: -0.17,
              color: AppColors.textWhite,
            ),
          ),
        ),
      ),
    );
  }
}
