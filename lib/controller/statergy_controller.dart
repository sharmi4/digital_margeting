// lib/controller/strategy_controller.dart

import 'dart:convert';

import 'package:digital_marketing_stratergy/model/seo_database_taskmodel.dart';
import 'package:digital_marketing_stratergy/service/aeo_statergy_api_service.dart';
import 'package:digital_marketing_stratergy/service/geo_statergy_api_service.dart';
import 'package:digital_marketing_stratergy/service/sem_statergy_api_service.dart';
import 'package:digital_marketing_stratergy/service/seo_statergy_api.service.dart';
import 'package:digital_marketing_stratergy/service/smm_statergy_api_service.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // <== Add this
import '../Helper.dart';
import '../service/aio_statergy_api_service.dart';
import '../service/am_statergy_api_service.dart';
import '../service/chatm_statergy_api_service.dart';
import '../service/cm_statergy_api_service.dart';
import '../service/com_m_statergy_api_service.dart';
import '../service/cro_statergy_api_service.dart';
import '../service/dp_statergy_api_service.dart';
import '../service/emailm_statergy_api_service.dart';
import '../service/fbao_statergy_api_service.dart';
import '../service/im_statergy_api_service.dart';
import '../service/lpo_statergy_api_service.dart';
import '../service/ls_statergy_api_service.dart';
import '../service/ma_statergy_api_service.dart';
import '../service/mm_statergy_api_service.dart';
import '../service/orm_statergy_api_service.dart';
import '../service/pa_statergy_api_service.dart';
import '../service/ppc_statergy_api_service.dart';
import '../service/rr_statergy_api_service.dart';
import '../service/swm_statergy_api_service.dart';
import '../service/sxo_statergy_api_service.dart';
import '../service/vm_statergy_api_service.dart';
import '../service/vso_statergy_api_service.dart';
import '../service/wat_statergy_api_service.dart';
import '../service/wvem_statergy_api_service.dart';
import '../view/stratergy_task/particular_stratergy_screen.dart';

class StrategyController extends GetxController {
  final isLoading = false.obs;
  final resultText = ''.obs;

  final StrategyApiService _geminiseoService = StrategyApiService();

  final SEMStrategyApiService semStrategyApiService = SEMStrategyApiService();

  final SMMStrategyApiService smmStrategyApiService = SMMStrategyApiService();

  final AEOStrategyApiService aeoStrategyApiService = AEOStrategyApiService();

  final GEOStrategyApiService geoStrategyApiService = GEOStrategyApiService();

  final AIOStrategyApiService aioStrategyApiService = AIOStrategyApiService();
  final SXOStrategyApiService sxoStrategyApiService = SXOStrategyApiService();
  final CMStrategyApiService cmStrategyApiService = CMStrategyApiService();
  final EMStrategyApiService emStrategyApiService = EMStrategyApiService();
  final IMStrategyApiService imStrategyApiService = IMStrategyApiService();
  final AMStrategyApiService amStrategyApiService = AMStrategyApiService();
  final VMStrategyApiService vmStrategyApiService = VMStrategyApiService();
  final MMStrategyApiService mmStrategyApiService = MMStrategyApiService();
  final ORMStrategyApiService ormStrategyApiService = ORMStrategyApiService();
  final CROStrategyApiService croStrategyApiService = CROStrategyApiService();
  final WATStrategyApiService watStrategyApiService = WATStrategyApiService();
  final PPCStrategyApiService ppcStrategyApiService = PPCStrategyApiService();
  final PAStrategyApiService paStrategyApiService = PAStrategyApiService();
  final RRStrategyApiService rrStrategyApiService = RRStrategyApiService();
  final LSStrategyApiService lsStrategyApiService = LSStrategyApiService();
  final VSOStrategyApiService vsoStrategyApiService = VSOStrategyApiService();
  final MaStatergyApiService maStatergyApiService = MaStatergyApiService();
  final ChatbatMStrategyApiService chatbatMStrategyApiService = ChatbatMStrategyApiService();
  final CommunityMStrategyApiService communityMStrategyApiService = CommunityMStrategyApiService();
  final DpStatergyApiService dpStatergyApiService = DpStatergyApiService();
  final WVEMStrategyApiService wvemStrategyApiService = WVEMStrategyApiService();
  final SWMStatergyApiService swmStatergyApiService = SWMStatergyApiService();
  final LPOStrategyApiService lpoStrategyApiService = LPOStrategyApiService();
  final FBAOStrategyApiService fbaoStrategyApiService = FBAOStrategyApiService();


  Future<void> submitStrategy() async {
    isLoading.value = true;

    try {
      final result = await _geminiseoService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>SEO>>>>>>statergy response$result ");

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

  //search engine marketing
  Future<void> submitSEMStrategy() async {
    isLoading.value = true;

    try {
      final result = await semStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>SEM>>>>>>statergy response$result ");

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

  //social media marketing

    Future<void> submitSMMStrategy() async {
    isLoading.value = true;

    try {
      final result = await smmStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>SMM>>>>>statergy response$result ");

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

        DatabaseHelper().insertSMMtaskdata(
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

    //Answer Engine Optimization

    Future<void> submitAEOStrategy() async {
    isLoading.value = true;

    try {
      final result = await aeoStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>GEO>>>>>statergy response$result ");

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

        DatabaseHelper().insertAEOtaskdata(
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

  //Generative Engine Optimization

    Future<void> submitGEOStrategy() async {
    isLoading.value = true;

    try {
      final result = await geoStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>GEO>>>>>statergy response$result ");

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

        DatabaseHelper().insertGEOtaskdata(
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

    //AI Integration Optimization

    Future<void> submitAIOStrategy() async {
    isLoading.value = true;

    try {
      final result = await aioStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>GEO>>>>>statergy response$result ");

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

        DatabaseHelper().insertAIOtaskdata(
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

      //Search Experience Optimization

    Future<void> submitSXOStrategy() async {
    isLoading.value = true;

    try {
      final result = await sxoStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>SEO>>>>>statergy response$result ");

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

        DatabaseHelper().insertSXOtaskdata(
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

        //Content Marketing

    Future<void> submitCMStrategy() async {
    isLoading.value = true;

    try {
      final result = await cmStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>CM>>>>>statergy response$result ");

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

        DatabaseHelper().insertCMtaskdata(
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

          //Email Marketing

    Future<void> submitEMStrategy() async {
    isLoading.value = true;

    try {
      final result = await emStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>EM>>>>>statergy response$result ");

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

        DatabaseHelper().insertEMtaskdata(
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

   //Influencer Marketing

    Future<void> submitIMStrategy() async {
    isLoading.value = true;

    try {
      final result = await imStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>IM>>>>>statergy response$result ");

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

        DatabaseHelper().insertIMtaskdata(
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

     //Affiliate Marketing

    Future<void> submitAMStrategy() async {
    isLoading.value = true;

    try {
      final result = await amStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>AM>>>>>statergy response$result ");

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

        DatabaseHelper().insertAMtaskdata(
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
 

    //Affiliate Marketing

    Future<void> submitVMStrategy() async {
    isLoading.value = true;

    try {
      final result = await vmStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>VM>>>>>statergy response$result ");

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

        DatabaseHelper().insertVMtaskdata(
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
 
 
    //Mobile Marketing

    Future<void> submitMMStrategy() async {
    isLoading.value = true;

    try {
      final result = await mmStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>VM>>>>>statergy response$result ");

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

        DatabaseHelper().insertMMtaskdata(
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


  //Online Reputation Management

    Future<void> submitORMStrategy() async {
    isLoading.value = true;

    try {
      final result = await ormStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>ORM>>>>>statergy response$result ");

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

        DatabaseHelper().insertORMtaskdata(
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


//Conversion Rate Optimization

    Future<void> submitCROStrategy() async {
    isLoading.value = true;

    try {
      final result = await croStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>ORM>>>>>statergy response$result ");

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

        DatabaseHelper().insertCROtaskdata(
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

  //Web Analytics and Tracking

    Future<void> submitWATStrategy() async {
    isLoading.value = true;

    try {
      final result = await watStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>ORM>>>>>statergy response$result ");

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

        DatabaseHelper().insertWATtaskdata(
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
  

    //Pay-Per-Click Advertising

    Future<void> submitPPCStrategy() async {
    isLoading.value = true;

    try {
      final result = await ppcStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>ORM>>>>>statergy response$result ");

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

        DatabaseHelper().insertPPCtaskdata(
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


       //Programmatic Advertising

    Future<void> submitPAStrategy() async {
    isLoading.value = true;

    try {
      final result = await paStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>PA>>>>>statergy response$result ");

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

        DatabaseHelper().insertPAtaskdata(
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

     
            //Programmatic Advertising

    Future<void> submitRRStrategy() async {
    isLoading.value = true;

    try {
      final result = await rrStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>RR>>>>>statergy response$result ");

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

        DatabaseHelper().insertRRtaskdata(
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


              //Local SEO 

    Future<void> submitLSStrategy() async {
    isLoading.value = true;

    try {
      final result = await lsStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>LS>>>>>statergy response$result ");

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

        DatabaseHelper().insertLStaskdata(
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

   //VSO

    Future<void> submitVSOStrategy() async {
    isLoading.value = true;

    try {
      final result = await vsoStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>LS>>>>>statergy response$result ");

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

        DatabaseHelper().insertVSOtaskdata(
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

    //MA

    Future<void> submitMAStrategy() async {
    isLoading.value = true;

    try {
      final result = await maStatergyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>MA>>>>>statergy response$result ");

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

        DatabaseHelper().insertMAtaskdata(
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

      //CHATBOT

    Future<void> submitCHATBOTMStrategy() async {
    isLoading.value = true;

    try {
      final result = await chatbatMStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>MA>>>>>statergy response$result ");

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

        DatabaseHelper().insertCHATMtaskdata(
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


      //CHATBOT

    Future<void> submitCOMMUNITYMStrategy() async {
    isLoading.value = true;

    try {
      final result = await communityMStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>MA>>>>>statergy response$result ");

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

        DatabaseHelper().insertCOMMUMtaskdata(
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

        //DP

    Future<void> submitDPStrategy() async {
    isLoading.value = true;

    try {
      final result = await dpStatergyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>DP>>>>>statergy response$result ");

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

        DatabaseHelper().insertDPtaskdata(
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

          //WVEM

    Future<void> submitWVEMStrategy() async {
    isLoading.value = true;

    try {
      final result = await wvemStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>WVEM>>>>>statergy response$result ");

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

        DatabaseHelper().insertWVEMtaskdata(
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

            //SWM

    Future<void> submitSWMStrategy() async {
    isLoading.value = true;

    try {
      final result = await swmStatergyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>SWM>>>>>statergy response$result ");

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

        DatabaseHelper().insertSWMtaskdata(
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

             //LPO

    Future<void> submitLPOStrategy() async {
    isLoading.value = true;

    try {
      final result = await lpoStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>LPO>>>>>statergy response$result ");

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

        DatabaseHelper().insertLPOtaskdata(
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

               //FBAO

    Future<void> submitFBAOStrategy() async {
    isLoading.value = true;

    try {
      final result = await fbaoStrategyApiService.sendToGemini();
      resultText.value = result!;
      print(">>>>>>>>>>>>>>FBAO>>>>>statergy response$result ");

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

        DatabaseHelper().insertFBAOtaskdata(
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
