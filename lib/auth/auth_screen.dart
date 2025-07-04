import 'package:digital_marketing_stratergy/auth/forgot_password_screen.dart';
import 'package:digital_marketing_stratergy/bottom_nav/bottom_navigation_screen.dart';
import 'package:digital_marketing_stratergy/view/create_statergy/stratergy_selection.dart';
import 'package:flutter/material.dart';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }
  int selectedIndex = 0; // 0 = Login, 1 = Register

  

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
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.textWhite),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                selectedIndex == 0
                    ? "Go ahead and set up your account"
                    : "Create your Account",
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
                "Sign in-up to enjoy the best marketing experience",
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
                        child: selectedIndex == 0
                            ? _buildLoginForm()
                            : _buildRegisterForm(),
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
          _buildToggleItem("Login", 0),
          _buildToggleItem("Register", 1),
        ],
      ),
    );
  }

  Widget _buildToggleItem(String title, int index) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedIndex = index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'AlbertSans',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black,
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
        ),
        const SizedBox(height: 10),
        const CustomTextField(
          icon: "assets/images/password_icon.png",
          hintText: 'Password',
          isVerified: true,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: (){
            Get.to(ForgotPasswordScreen());
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Forgot Password?",
              style: primaryFont(
                color: AppColors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 11,
                height: 1.0,
                letterSpacing: -0.13,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        _buildSubmitButton("Login"),
        ksizedbox40,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.grey
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("or Login with",
              style: primaryFont(
                fontWeight: FontWeight.w700,
                  fontSize: 12.5,
                  height: 1.0, // 100% line height
                  letterSpacing: -0.13,
                    color: AppColors.grey
              
              ),),
            ),
             Padding(
               padding: const EdgeInsets.only(left: 5),
               child: Container(
                height: 1,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.grey
                ),
                           ),
             ),
          ],
        ),
        ksizedbox40,
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
          
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/email_image.png"),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Sign up with Google",
                style: primaryFont(
                  fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: 1.2,           // 18px / 15px = 1.2
                    letterSpacing: -0.17,
                ),),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomTextField(
          icon: "assets/images/user_icon.png",
          hintText: 'Full Name',
        ),
        const SizedBox(height: 10),
        const CustomTextField(
          icon: "assets/images/phone_icon.png",
          hintText: 'Mobile Number',
          isVerified: true,
        ),
        const SizedBox(height: 10),
        const CustomTextField(
          icon: "assets/images/email_icon.png",
          hintText: 'Email address',
        ),
        const SizedBox(height: 10),
        const CustomTextField(
          icon: "assets/images/password_icon.png",
          hintText: 'Password',
          isVerified: true,
        ),
        const SizedBox(height: 10),
        const CustomTextField(
          icon: "assets/images/confirm_password_icon.png",
          hintText: 'Confirm Password',
          isVerified: true,
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: (){
                setState(() {
      selectedIndex = 0; // Switch to Login form
    });

          },
          child: _buildSubmitButton("Register")),
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
        onPressed: ()async {
          if (title == "Login") {
             final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', true);
            // Replace HomeScreen() with your actual home screen
            Get.to(StrategySelectionScreen());
          } else if (title == "Register") {
            // Optional: Show success or return to Login
            Get.snackbar("Success", "Account registered successfully!",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );

            // Switch to login screen
            setState(() {
              selectedIndex = 0;
            });
          }
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
