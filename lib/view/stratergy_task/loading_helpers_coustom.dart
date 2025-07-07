import 'package:digital_marketing_stratergy/view/stratergy_task/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoustomLoadingHelper {
  static bool _isDialogVisible = false;

  static void show() {
    if (_isDialogVisible) return;
    _isDialogVisible = true;

    Get.dialog(
      const LoadingScreen(),
      barrierDismissible: false,
    );
  }

  static void hide() {
    if (_isDialogVisible && Get.isDialogOpen == true) {
      Get.back(); // dismiss dialog
      _isDialogVisible = false;
    }
  }
}
