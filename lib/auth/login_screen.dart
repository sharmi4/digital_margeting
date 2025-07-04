// import 'package:digital_marketing_stratergy/auth/register_screen.dart';
// import 'package:digital_marketing_stratergy/const/app_color.dart';
// import 'package:digital_marketing_stratergy/const/app_fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
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
//                 "Go ahead and set up your account",
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
//                       icon: "assets/images/email_icon.png",
//                       hintText: 'email address',
//                     ),
//                        ksizedbox10,
//                     const CustomTextField(
//                       icon: "assets/images/password_icon.png",
//                       hintText: 'Password',
//                       isVerified: true,
//                     ),
//                     ksizedbox20,
//                     Text("Forgot Password ?",
//                     style: primaryFont(
//                       color: AppColors.blue,
//                       fontWeight: FontWeight.w500,   // Medium
//     fontSize: 10,
//     height: 1.0,                   // 100% line-height = 1.0
//     letterSpacing: -0.13,
//                     ),),
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
//                             Get.to(RegisterScreen());
//                           },
//                           child: Text( "Login" ,
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

//   Widget _buildToggleItem(String title, int index) {
//     bool isSelected = selectedIndex == index;
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           decoration: BoxDecoration(
//             color: isSelected ? AppColors.blue : Colors.transparent,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           alignment: Alignment.center,
//           child: Text(
//             title,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
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
