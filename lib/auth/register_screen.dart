// import 'package:digital_marketing_stratergy/auth/login_screen.dart' show LoginScreen;
// import 'package:digital_marketing_stratergy/const/app_color.dart';
// import 'package:digital_marketing_stratergy/const/app_fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   int selectedIndex = 1; // 0 = Login, 1 = Register

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.blue,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(left: 15,right: 15),
//               child: Icon(Icons.arrow_back_ios_new,
//               color: AppColors.textWhite,),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
//               child:  Text(
//                 "Create your Account",
//                 style: primaryFont(
//                   fontWeight: FontWeight.w600, // 600 weight = SemiBold
//     fontSize: 24,
//     height: 1.0, // line-height: 100%
//     letterSpacing: -0.17,
//     color: AppColors.textWhite
//                 )
//               ),
//             ),
//             const SizedBox(height: 10),
//              Padding(
//                padding: const EdgeInsets.only(left: 15,right: 15),
//                child: Text(
//                 textAlign: TextAlign.center,
//                 "Sign in-up to enjoy the best marketing experience",
//                 style: primaryFont(
//                   fontWeight: FontWeight.w300,   // Light (300)
//     fontSize: 14,
//     height: 14.64 / 14,            // Flutter's `height` is a multiplier
//     letterSpacing: -0.13,
//     color: AppColors.textWhite
//                 )
//                            ),
//              ),
//            ksizedbox30,
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//                 ),
//                 child: Column(
//                   children: [
//                     ksizedbox30,
//                     _buildCustomToggle(),
//                     const SizedBox(height: 20),

//                     const CustomTextField(
//                       icon: "assets/images/user_icon.png",
//                       hintText: 'Full Name',
//                     ),
//                        ksizedbox10,
//                     const CustomTextField(
//                       icon: "assets/images/phone_icon.png",
//                       hintText: 'Mobile Number',
//                       isVerified: true,
//                     ),
//                        ksizedbox10,
//                     const CustomTextField(
//                       icon: "assets/images/email_icon.png",
//                       hintText: 'email address',
//                     ),
//                        ksizedbox10,
//                     const CustomTextField(
//                       icon: "assets/images/password_icon.png",
//                       hintText: 'Password',
//                       isVerified: true,
//                     ),
//                     ksizedbox10,
//                     const CustomTextField(
//                       icon: "assets/images/confirm_password_icon.png",
//                       hintText: 'Confirm Password',
//                       isVerified: true,
//                     ),

//                     Spacer(),
//                     Padding(
//         padding: const EdgeInsets.only(left: 10,right: 10),
//         child: SizedBox(
//                         width: double.infinity,
//                         height: 50,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.blue,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           onPressed: () {
//                             Get.to(LoginScreen());
//                           },
//                           child: Text("Register",
//                           style: primaryFont(
//                             fontWeight: FontWeight.w600, // 500 = medium
//             fontSize: 17.0,
//             height: 18 / 15, // line-height divided by font-size
//             letterSpacing: -0.17,
//             color: AppColors.textWhite
//                           ),),
//                         ),
//                       ),
//       ),
                    
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
      
//     );
//   }

//   Widget _buildCustomToggle() {
//     return Container(
//       height: 48,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           _buildToggleItem("Login", 0),
//           _buildToggleItem("Register", 1),
//         ],
//       ),
//     );
//   }



// }
// class CustomTextField extends StatelessWidget {
//   final String icon;
//   final String hintText;
//   final bool isVerified;

//   const CustomTextField({
//     Key? key,
//     required this.icon,
//     required this.hintText,
//     this.isVerified = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 55,
//       width: double.infinity, // Full width
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       decoration: BoxDecoration(
//         color: Colors.grey[200], // Background color
//         borderRadius: BorderRadius.circular(12),
     
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       child: TextField(
//         decoration: InputDecoration(
//           prefixIcon: Image.asset(
//             icon,
//             width: 24,
//             height: 24,
//           ),
//           hintText: hintText,
//           hintStyle: primaryFont(
//              fontWeight: FontWeight.w500,     // Medium (500)
//     fontSize: 14,
//     height: 14.64 / 14,              // Flutter uses line-height as a multiplier
//     letterSpacing: -0.13,
//           ),
//           border: InputBorder.none,
//           filled: true,
//           fillColor: Colors.transparent, // So container color shows
//           contentPadding: const EdgeInsets.symmetric(vertical: 14),
//           suffixIcon: isVerified
//               ? const Icon(Icons.check_circle, color: Colors.lightBlueAccent)
//               : null,
//         ),
//       ),
//     );
//   }
// }
