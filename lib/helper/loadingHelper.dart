import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class LoadingHelper {
  static ProgressDialog? pr;

  static Future<void> show(BuildContext context) async {
    if (pr == null) {
      pr = ProgressDialog(
        context,
        type: ProgressDialogType.normal,
        isDismissible: false,
        showLogs: false,
      );

      pr!.style(
        message: 'Please wait...',
        borderRadius: 20.0,
        backgroundColor: Colors.white,
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
        ),
        messageTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          fontFamily: "Manrope",
        ),
      );
    }

    // If it's not showing, then show
    if (!(await pr!.isShowing())) {
      await pr!.show();
    } else {
      print("ProgressDialog already shown");
    }
  }

  static Future<void> hide() async {
    if (pr != null && await pr!.isShowing()) {
      await pr!.hide();
    }
  }
}
