// lib/controller/strategy_controller.dart

import 'dart:convert';

import 'package:digital_marketing_stratergy/model/seo_database_taskmodel.dart';
import 'package:digital_marketing_stratergy/service/sem_statergy_api_service.dart';
import 'package:digital_marketing_stratergy/service/seo_statergy_api.service.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // <== Add this
import '../Helper.dart';
import '../view/stratergy_task/particular_stratergy_screen.dart';

class StrategyController extends GetxController {
  final isLoading = false.obs;
  final resultText = ''.obs;

  final StrategyApiService _geminiseoService = StrategyApiService();

  final SEMStrategyApiService semStrategyApiService = SEMStrategyApiService();


  Future<void> submitStrategy() async {
    isLoading.value = true;

    try {
      final result = await _geminiseoService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>>>>>>statergy response$result ");

      List<dynamic> jData = json.decode(result);
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      DateTime startDate = DateTime.now();

      // Start from today

      for (int s = 0; s < jData.length; s++) {
        String formattedDate = formatter.format(
          startDate.add(Duration(days: s)),
        );

        Helper.item.add(
          TaskItem1(
            jData[s]["title"] ?? "",
            false,
            jData[s]["youtube"] ?? '',
            (jData[s]["instructions"] as List<dynamic>).join('\n'),
          ),
        );

        DatabaseHelper().insertseotaskdata(
          SeoTaskModel(
            insturctions: (jData[s]["instructions"] as List<dynamic>).join(
              '\n',
            ),
            taskname: jData[s]["title"] ?? "",
            iscompleted: 0,
            snumber: s,
            date: formattedDate,
            type: 'API',
            businessId: Helper.businessId, // Assign incremented date
          ),
        );
      }
    } catch (e) {
      resultText.value = 'Error: $e';
      print("errror>>>>>>>>>>>>>>>$e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitSEMStrategy() async {
    isLoading.value = true;

    try {
      final result = await semStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>>>>>>statergy response$result ");

      List<dynamic> jData = json.decode(result);
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      DateTime startDate = DateTime.now();

      // Start from today

      for (int s = 0; s < jData.length; s++) {
        String formattedDate = formatter.format(
          startDate.add(Duration(days: s)),
        );

        Helper.item.add(
          TaskItem1(
            jData[s]["title"] ?? "",
            false,
            jData[s]["youtube"] ?? '',
            (jData[s]["instructions"] as List<dynamic>).join('\n'),
          ),
        );

        DatabaseHelper().insertSEMtaskdata(
          SeoTaskModel(
            insturctions: (jData[s]["instructions"] as List<dynamic>).join(
              '\n',
            ),
            taskname: jData[s]["title"] ?? "",
            iscompleted: 0,
            snumber: s,
            date: formattedDate,
            type: 'API',
            businessId: Helper.businessId, // Assign incremented date
          ),
        );
      }
    } catch (e) {
      resultText.value = 'Error: $e';
      print("errror>>>>>>>>>>>>>>>$e");
    } finally {
      isLoading.value = false;
    }
  }
}
