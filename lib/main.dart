import 'package:digital_marketing_stratergy/auth/auth_screen.dart';
import 'package:digital_marketing_stratergy/bottom_nav/bottom_navigation_screen.dart';
import 'package:digital_marketing_stratergy/controller/calender_controller.dart';
import 'package:digital_marketing_stratergy/controller/statergy_controller.dart';
import 'package:digital_marketing_stratergy/firebase_options.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:digital_marketing_stratergy/view/create_statergy/stratergy_selection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize local SQLite database (optional: assign to a global var)
  await DatabaseHelper().initDb();

  runApp(const MyApp());
  Get.put(GeminiController());
  Get.put(StrategyController());

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLoginStatus();
    });
    super.initState();
  }
void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Get.offAll(() => BottomBar());
    } else {
      Get.offAll(() => AuthScreen());
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: StrategySelectionScreen(),
    );
  }
}

