import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart'; // Make sure you have this package or the relevant dialog package

class LoadingHelper {
  static  ProgressDialog ? pr;

  // Initialize ProgressDialog with context
  static show(BuildContext context) async {
    /* Timer(
         const Duration(seconds: 60),
             () => dismissProgressDialog());*/
    pr = ProgressDialog(context, type: ProgressDialogType.normal,
        isDismissible: true,
        showLogs: false);
    pr!.style(
        message: 'Please wait...',

        borderRadius: 20.0,
        backgroundColor: Colors.white,
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: const TextStyle(
            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400,fontFamily: "Manrope")
    );
    await pr!.show();

  }

  static hide() async {
    if(pr != null){
      if(pr!.isShowing()) {
        pr!.hide();
      }
    }
  }
}
