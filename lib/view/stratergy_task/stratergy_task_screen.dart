import 'package:digital_marketing_stratergy/Helper.dart';
import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:digital_marketing_stratergy/controller/statergy_controller.dart';
import 'package:digital_marketing_stratergy/model/seo_statergy_model.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/aeo_task/aeo_stratergy_screen.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/loading_helpers_coustom.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/sem_task/sem_stratergy_screen.dart';
import 'package:digital_marketing_stratergy/view/stratergy_task/smm_task/smm_stratergy_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'aio_task/aio_stratergy_screen.dart';
import 'am_task/am_statergy_screen.dart';
import 'chatm_task/chatm_statergy_screen.dart';
import 'cm_task/cm_statergy_screen.dart';
import 'comm_m_task/comm_m_statergy_screen.dart';
import 'cro_task/cro_statergy_screen.dart';
import 'dp_task/dp_statergy_screen.dart';
import 'em_task/em_statergy_screen.dart';
import 'fbao_task/fbao_statergy_screen.dart';
import 'geo_task/geo_stratergy_screen.dart';
import 'im_task/im_statergy_screen.dart';
import 'lpo_task/lpo_statergy_screen.dart';
import 'ls_task/ls_statergy_screen.dart';
import 'ma_task/ma_statergy_screen.dart';
import 'mm_task/mm_statergy_screen.dart';
import 'orm_task/orm_statergy_screen.dart';
import 'pa_task/pa_statergy_screen.dart';
import 'particular_stratergy_screen.dart';
import 'ppc_task/ppc_statergy_screen.dart';
import 'rr_task/rr_statergy_screen.dart';
import 'swm_task/swm_statergy_screen.dart';
import 'sxo_task.dart/sxo_stratergy_screen.dart';
import 'vm/vm_statergy_screen.dart';
import 'vso_task/vso_statergy_screen.dart';
import 'wat_task/wat_statergy_screen.dart';
import 'wvem_task/wvem_statergy_screen.dart';

class StratergyTaskScreen extends StatefulWidget {
  const StratergyTaskScreen({super.key});

  @override
  State<StratergyTaskScreen> createState() => _StratergyTaskScreenState();
}

class _StratergyTaskScreenState extends State<StratergyTaskScreen> {
  final seostatergyController = Get.find<StrategyController>();

  final List<Map<String, dynamic>> taskData = [
    {
      "title": "Search Engine Optimization (SEO)",
      "icon": "assets/icons/seo.png",
      "completed": 0,
      "total": 0,
      "xp": 500,
      "color": AppColors.blue,
    },
    {
      "title": "Search Engine Marketing (SEM)",
      "icon": "assets/icons/sem.png",
      "completed": 0,
      "total": 0,
      "xp": 500,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Social Media Marketing (SMM)",
      "icon": "assets/images/social.png",
      "completed": 0,
      "total": 0,
      "xp": 800,
      "color": AppColors.blue,
    },
    {
      "title": "Answer Engine Optimization (AEO) ",
      "icon": "assets/icons/aeo.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Generative Engine Optimization (GEO)",
      "icon": "assets/icons/geo.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "AI Integration Optimization (AIO)",
      "icon": "assets/icons/aio.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Search Experience Optimization (SXO)",
      "icon": "assets/icons/sxo.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.blue,
    },

    {
      "title": "Content Marketing (CM)",
      "icon": "assets/images/content_creation.png",
      "completed": 0,
      "total": 0,
      "xp": 500,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Email Marketing (EM)",
      "icon": "assets/images/email.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Influencer Marketing (IM)" ,
      "icon": "assets/icons/im.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Affiliate Marketing (AM)",
      "icon": "assets/icons/am.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Video Marketing (VM)",
      "icon": "assets/icons/vm.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Mobile Marketing (MM)",
      "icon": "assets/icons/mm.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Online Reputation Management (ORM)",
      "icon": "assets/icons/orm.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Conversion Rate Optimization (CRO)",
      "icon": "assets/icons/cro.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Web Analytics and Tracking (WAT)",
      "icon": "assets/icons/wat.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Pay-Per-Click Advertising (PPC)",
      "icon": "assets/icons/ppca.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Programmatic Advertising (PA)",
      "icon": "assets/icons/pa.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Remarketing / Retargeting (RR)",
      "icon": "assets/icons/Retargeting.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Local SEO (LS)",
      "icon": "assets/icons/localseo.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Voice Search Optimization (VSO)",
      "icon": "assets/icons/vso.png",
      "completed": 0,
      "total": 00,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Marketing Automation (MA)",
      "icon": "assets/icons/ma.png",
      "completed": 7,
      "total": 10,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Chatbot Marketing (CM)",
      "icon": "assets/icons/ca.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Community Management (CM)",
      "icon": "assets/icons/com.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Digital PR (DP)",
      "icon": "assets/icons/dpr.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Webinar and Virtual Event Marketing (WVEN)",
      "icon": "assets/icons/wvem.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "SMS & WhatsApp Marketing (SWM)",
      "icon": "assets/icons/swm.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    {
      "title": "Landing Page Optimization (LPO)",
      "icon": "assets/icons/lpo.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.darkyellow,
    },
    {
      "title": "Funnel Building and Optimization (FBAO)",
      "icon": "assets/icons/fbo.png",
      "completed": 0,
      "total": 0,
      "xp": 300,
      "color": AppColors.blue,
    },
    // {
    //   "title": "Google My Business",
    //   "icon": "assets/images/gmbusinees.png",
    //   "completed": 9,
    //   "total": 10,
    //   "xp": 950,
    //   "color": AppColors.blue,
    // },
  ];

  List<Map<String, dynamic>> seogettask = [];
  List<Map<String, dynamic>> semgettask = [];
  List<Map<String, dynamic>> smmgettask = [];
  List<Map<String, dynamic>> aeogettask = [];
  List<Map<String, dynamic>> geogettask = [];
  List<Map<String, dynamic>> aiogettask = [];
  List<Map<String, dynamic>> sxogettask = [];
  List<Map<String, dynamic>> cmgettask = [];
  List<Map<String, dynamic>> emgettask = [];
  List<Map<String, dynamic>> imgettask = [];
  List<Map<String, dynamic>> amgettask = [];
  List<Map<String, dynamic>> vmgettask = [];
  List<Map<String, dynamic>> mmgettask = [];
  List<Map<String, dynamic>> ormgettask = [];
  List<Map<String, dynamic>> crogettask = [];
  List<Map<String, dynamic>> watgettask = [];
  List<Map<String, dynamic>> ppcgettask = [];    
  List<Map<String, dynamic>> pagettask = [];  
  List<Map<String, dynamic>> rrgettask = [];  
  List<Map<String, dynamic>> lsgettask = [];  
  List<Map<String, dynamic>> vsogettask = [];
  List<Map<String, dynamic>> magettask = [];
  List<Map<String, dynamic>> chatmgettask = []; 
  List<Map<String, dynamic>> commumgettask = []; 
  List<Map<String, dynamic>> dpgettask = [];
  List<Map<String, dynamic>> wvemgettask = [];
  List<Map<String, dynamic>> swmgettask = []; 
    List<Map<String, dynamic>> lpogettask = [];     
    List<Map<String, dynamic>> fbaogettask = [];                                                                                                 

  @override
  void initState() {
    super.initState();

    statergydbinsert();
    gettaskdb();
    getSEMtaskdb();
    getSMMtaskdb();
    getAEOtaskdb();
    getGEOtaskdb();
    getAIOtaskdb();
    getSXOtaskdb();
    getCMtaskdb();
    getEMtaskdb();
    getIMtaskdb();
    getAMtaskdb();
    getVMtaskdb();
    getMMtaskdb();
    getORMtaskdb();
    getCROtaskdb();
    getWATtaskdb();
    getPPCtaskdb();
    getPAtaskdb();
    getRRtaskdb();
    getLStaskdb();
    getVSOtaskdb();
    getMAtaskdb();
    getCHATMtaskdb();
    getCOMMUMtaskdb();
    getDPtaskdb();
    getWVEMtaskdb();
    getSWMtaskdb();
    getLPOtaskdb();
    getFBAOtaskdb();
  }

  void statergydbinsert() async {
    for (int s = 0; s < taskData.length; s++) {
      await DatabaseHelper().insertstatergydata(
        StrategyModel(
          content: taskData[s]["title"].toString(),
          completedtask: 0,
          totaltask: 0,
          snumber: s,
        ),
      );
    }
  }

  void gettaskdb() async {
    seogettask = await DatabaseHelper().getSeoTaskById(Helper.businessId);
    int completed =
        seogettask.where((task) => task["iscompleted"] == "1").length;
    int total = seogettask.length;
    taskData[0]["completed"] = completed;
    taskData[0]["total"] = total;
    print(">>>> SEO completed: $completed / $total");
    setState(() {});
  }

  void getSEMtaskdb() async {
    semgettask = await DatabaseHelper().getSEMTaskById(Helper.businessId);
    int completed =
        semgettask.where((task) => task["iscompleted"] == "1").length;
    int total = semgettask.length;
    taskData[1]["completed"] = completed;
    taskData[1]["total"] = total;
    print(">>>> SEM completed: $completed / $total");
    setState(() {});
  }

  void getSMMtaskdb() async {
    smmgettask = await DatabaseHelper().getSMMTaskById(Helper.businessId);
    int completed =
        smmgettask.where((task) => task["iscompleted"] == "1").length;
    int total = smmgettask.length;
    taskData[2]["completed"] = completed;
    taskData[2]["total"] = total;
    print(">>>> SMM completed: $completed / $total");
    setState(() {});
  }

  void getAEOtaskdb() async {
    aeogettask = await DatabaseHelper().getAEOTaskById(Helper.businessId);
    int completed =
        aeogettask.where((task) => task["iscompleted"] == "1").length;
    int total = aeogettask.length;
    taskData[3]["completed"] = completed;
    taskData[3]["total"] = total;
    print(">>>> aeo completed: $completed / $total");
    setState(() {});
  }

  void getGEOtaskdb() async {
    geogettask = await DatabaseHelper().getGEOTaskById(Helper.businessId);
    int completed =
        geogettask.where((task) => task["iscompleted"] == "1").length;
    int total = geogettask.length;
    taskData[4]["completed"] = completed;
    taskData[4]["total"] = total;
    print(">>>> SMM completed: $completed / $total");
    setState(() {});
  }

  void getAIOtaskdb() async {
    aiogettask = await DatabaseHelper().getAIOTaskById(Helper.businessId);
    int completed =
        aiogettask.where((task) => task["iscompleted"] == "1").length;
    int total = aiogettask.length;
    taskData[5]["completed"] = completed;
    taskData[5]["total"] = total;
    print(">>>> AIO completed: $completed / $total");
    setState(() {});
  }

  void getSXOtaskdb() async {
    sxogettask = await DatabaseHelper().getSXOTaskById(Helper.businessId);
    int completed =
        sxogettask.where((task) => task["iscompleted"] == "1").length;
    int total = sxogettask.length;
    taskData[6]["completed"] = completed;
    taskData[6]["total"] = total;
    print(">>>> sxO completed: $completed / $total");
    setState(() {});
  }

    void getCMtaskdb() async {
    cmgettask = await DatabaseHelper().getCMTaskById(Helper.businessId);
    int completed =
        cmgettask.where((task) => task["iscompleted"] == "1").length;
    int total = cmgettask.length;
    taskData[7]["completed"] = completed;
    taskData[7]["total"] = total;
    print(">>>> cm completed: $completed / $total");
    setState(() {});
  }

  void getEMtaskdb() async {
    emgettask = await DatabaseHelper().getEMTaskById(Helper.businessId);
    int completed =
        emgettask.where((task) => task["iscompleted"] == "1").length;
    int total = emgettask.length;
    taskData[8]["completed"] = completed;
    taskData[8]["total"] = total;
    print(">>>> em completed: $completed / $total");
    setState(() {});
  }

   void getIMtaskdb() async {
    imgettask = await DatabaseHelper().getIMTaskById(Helper.businessId);
    int completed =
        imgettask.where((task) => task["iscompleted"] == "1").length;
    int total = imgettask.length;
    taskData[9]["completed"] = completed;
    taskData[9]["total"] = total;
    print(">>>> im completed: $completed / $total");
    setState(() {});
  }

  void getAMtaskdb() async {
    amgettask = await DatabaseHelper().getAMTaskById(Helper.businessId);
    int completed =
        amgettask.where((task) => task["iscompleted"] == "1").length;
    int total = amgettask.length;
    taskData[10]["completed"] = completed;
    taskData[10]["total"] = total;
    print(">>>> am completed: $completed / $total");
    setState(() {});
  }

  void getVMtaskdb() async {
    vmgettask = await DatabaseHelper().getVMTaskById(Helper.businessId);
    int completed =
        vmgettask.where((task) => task["iscompleted"] == "1").length;
    int total = vmgettask.length;
    taskData[11]["completed"] = completed;
    taskData[11]["total"] = total;
    print(">>>> vm completed: $completed / $total");
    setState(() {});
  }

  void getMMtaskdb() async {
    mmgettask = await DatabaseHelper().getMMTaskById(Helper.businessId);
    int completed =
        mmgettask.where((task) => task["iscompleted"] == "1").length;
    int total = mmgettask.length;
    taskData[12]["completed"] = completed;
    taskData[12]["total"] = total;
    print(">>>> mm completed: $completed / $total");
    setState(() {});
  }

  void getORMtaskdb() async {
    ormgettask = await DatabaseHelper().getORMTaskById(Helper.businessId);
    int completed =
        ormgettask.where((task) => task["iscompleted"] == "1").length;
    int total = ormgettask.length;
    taskData[13]["completed"] = completed;
    taskData[13]["total"] = total;
    print(">>>> mm completed: $completed / $total");
    setState(() {});
  }

    void getCROtaskdb() async {
    crogettask = await DatabaseHelper().getCROTaskById(Helper.businessId);
    int completed =
        crogettask.where((task) => task["iscompleted"] == "1").length;
    int total = crogettask.length;
    taskData[14]["completed"] = completed;
    taskData[14]["total"] = total;
    print(">>>> cro completed: $completed / $total");
    setState(() {});
  }

    void getWATtaskdb() async {
    watgettask = await DatabaseHelper().getWATTaskById(Helper.businessId);
    int completed =
        watgettask.where((task) => task["iscompleted"] == "1").length;
    int total = watgettask.length;
    taskData[15]["completed"] = completed;
    taskData[15]["total"] = total;
    print(">>>> wat completed: $completed / $total");
    setState(() {});
  }

  void getPPCtaskdb() async {
    ppcgettask = await DatabaseHelper().getPPCTaskById(Helper.businessId);
    int completed =
        ppcgettask.where((task) => task["iscompleted"] == "1").length;
    int total = ppcgettask.length;
    taskData[16]["completed"] = completed;
    taskData[16]["total"] = total;
    print(">>>> wat completed: $completed / $total");
    setState(() {});
  }

    void getPAtaskdb() async {
    pagettask = await DatabaseHelper().getPATaskById(Helper.businessId);
    int completed =
        pagettask.where((task) => task["iscompleted"] == "1").length;
    int total = pagettask.length;
    taskData[17]["completed"] = completed;
    taskData[17]["total"] = total;
    print(">>>> pa completed: $completed / $total");
    setState(() {});
  }

      void getRRtaskdb() async {
    rrgettask = await DatabaseHelper().getRRTaskById(Helper.businessId);
    int completed =
        rrgettask.where((task) => task["iscompleted"] == "1").length;
    int total = rrgettask.length;
    taskData[18]["completed"] = completed;
    taskData[18]["total"] = total;
    print(">>>> rr completed: $completed / $total");
    setState(() {});
  }

        void getLStaskdb() async {
    lsgettask = await DatabaseHelper().getLSTaskById(Helper.businessId);
    int completed =
        lsgettask.where((task) => task["iscompleted"] == "1").length;
    int total = lsgettask.length;
    taskData[19]["completed"] = completed;
    taskData[19]["total"] = total;
    print(">>>> LS completed: $completed / $total");
    setState(() {});
  }

          void getVSOtaskdb() async {
    vsogettask = await DatabaseHelper().getVSOTaskById(Helper.businessId);
    int completed =
        vsogettask.where((task) => task["iscompleted"] == "1").length;
    int total = vsogettask.length;
    taskData[20]["completed"] = completed;
    taskData[20]["total"] = total;
    print(">>>> VSO completed: $completed / $total");
    setState(() {});
  }

            void getMAtaskdb() async {
    magettask = await DatabaseHelper().getMATaskById(Helper.businessId);
    int completed =
        magettask.where((task) => task["iscompleted"] == "1").length;
    int total = magettask.length;
    taskData[21]["completed"] = completed;
    taskData[21]["total"] = total;
    print(">>>> MA completed: $completed / $total");
    setState(() {});
  }

              void getCHATMtaskdb() async {
    chatmgettask = await DatabaseHelper().getCHATMTaskById(Helper.businessId);
    int completed =
        chatmgettask.where((task) => task["iscompleted"] == "1").length;
    int total = chatmgettask.length;
    taskData[22]["completed"] = completed;
    taskData[22]["total"] = total;
    print(">>>> CHATM completed: $completed / $total");
    setState(() {});
  }

                void getCOMMUMtaskdb() async {
    commumgettask = await DatabaseHelper().getCOMMUMTaskById(Helper.businessId);
    int completed =
        commumgettask.where((task) => task["iscompleted"] == "1").length;
    int total = commumgettask.length;
    taskData[23]["completed"] = completed;
    taskData[23]["total"] = total;
    print(">>>> COMMUNITYM completed: $completed / $total");
    setState(() {});
  }

                  void getDPtaskdb() async {
    dpgettask = await DatabaseHelper().getDPTaskById(Helper.businessId);
    int completed =
        dpgettask.where((task) => task["iscompleted"] == "1").length;
    int total = dpgettask.length;
    taskData[24]["completed"] = completed;
    taskData[24]["total"] = total;
    print(">>>> DP completed: $completed / $total");
    setState(() {});
  }

                    void getWVEMtaskdb() async {
    wvemgettask = await DatabaseHelper().getWVEMTaskById(Helper.businessId);
    int completed =
        wvemgettask.where((task) => task["iscompleted"] == "1").length;
    int total = wvemgettask.length;
    taskData[25]["completed"] = completed;
    taskData[25]["total"] = total;
    print(">>>> WVEM completed: $completed / $total");
    setState(() {});
  }
                     
                      void getSWMtaskdb() async {
    swmgettask = await DatabaseHelper().getSWMTaskById(Helper.businessId);
    int completed =
        swmgettask.where((task) => task["iscompleted"] == "1").length;
    int total = swmgettask.length;
    taskData[26]["completed"] = completed;
    taskData[26]["total"] = total;
    print(">>>> SWM completed: $completed / $total");
    setState(() {});
  }

                        void getLPOtaskdb() async {
    lpogettask = await DatabaseHelper().getLPOTaskById(Helper.businessId);
    int completed =
        lpogettask.where((task) => task["iscompleted"] == "1").length;
    int total = lpogettask.length;
    taskData[27]["completed"] = completed;
    taskData[27]["total"] = total;
    print(">>>> LPO completed: $completed / $total");
    setState(() {});
  }

                          void getFBAOtaskdb() async {
    fbaogettask = await DatabaseHelper().getFBAOTaskById(Helper.businessId);
    int completed =
        fbaogettask.where((task) => task["iscompleted"] == "1").length;
    int total = fbaogettask.length;
    taskData[28]["completed"] = completed;
    taskData[28]["total"] = total;
    print(">>>> FBAO completed: $completed / $total");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Row(
          children: [
            Text(
              "Digital Marketing Strategy",
              style: primaryFont(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                height: 1.2,
                letterSpacing: -0.17,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE6F1FF),
            ),
            child: const Icon(
              Icons.notifications_active_sharp,
              color: Colors.blue,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Mission Card
            Container(
              height: 110,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF531012),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/mission.png',
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Mission",
                        style: primaryFont(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          height: 15 / 18,
                          letterSpacing: -0.13,
                          color: AppColors.textWhite,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Complete Tasks, Earn XP, \nand Grow your Business",
                        style: primaryFont(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.2,
                          height: 14.64 / 12.2,
                          letterSpacing: -0.13,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// Task Cards
            ListView.builder(
              itemCount: taskData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final task = taskData[index];
                return InkWell(
                  onTap: () async {
                    if (index == 0) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              SeoStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                    if (index == 1) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              SemStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                    if (index == 2) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              SmmStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                    if (index == 3) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              AeoStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                    if (index == 4) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              GeoStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                    if (index == 5) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              AioStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                    if (index == 6) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              SxoStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                      if (index == 7) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              CMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                     if (index == 8) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              EMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                       if (index == 9) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              IMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                       if (index == 10) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              AMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                      if (index == 11) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              VMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                     if (index == 12) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              MMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                     if (index == 13) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              ORMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                    if (index == 14) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              CROStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                    if (index == 15) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              WATStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                    if (index == 16) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              PPCStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                    if (index == 17) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              PAStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                      if (index == 18) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              RRStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                        if (index == 19) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              LSStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                    
                        if (index == 20) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              VSOStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                        if (index == 21) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              MAStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                         if (index == 22) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              CHATMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                            if (index == 23) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              CommunityMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                              if (index == 24) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              DPStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                                 if (index == 25) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              WVEMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                                 if (index == 26) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              SWMStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                                  if (index == 27) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              LPOStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }

                                  if (index == 28) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.to(
                          () =>
                              FBAOStrategyScreen(businessId: Helper.businessId),
                        );
                      });
                    }
                  },
                  child: buildTaskCard(
                    context,
                    title: task["title"],
                    iconPath: task["icon"],
                    completed: task["completed"],
                    total: task["total"],
                    xp: task["xp"],
                    color: task["color"],
                    index: index,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTaskCard(
    BuildContext context, {
    required String title,
    required String iconPath,
    required int completed,
    required int total,
    required int xp,
    required Color color,
    required int index,
  }) {
    final double progress = total > 0 ? completed / total : 0;
    final progressColor =
        (color == AppColors.blue) ? Colors.yellow : Colors.grey;

    return Container(
      height: 164,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Wrap this Row with Flexible to prevent overflow
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {},
                      child: Image.asset(
                        iconPath,
                        height: 60,
                        fit: BoxFit.fitHeight,
                      ),
                    ),

                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Your new title and subtitle
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: primaryFont(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppColors.textWhite,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // const SizedBox(height: 2),
                              // InkWell(
                              //   onTap: ()async{
                              //    print("Tapped SEO Strategy at: ${DateTime.now()}");
                              //       LoadingHelper.show();
                              //       await seostatergyController.submitStrategy();
                              //       LoadingHelper.hide();
                              //       print("Navigating to SeoStrategyScreen at: ${DateTime.now()}");
                              //    WidgetsBinding.instance.addPostFrameCallback((_) {
                              //      Get.to(() => SeoStrategyScreen(businessId: Helper.businessId));
                              //    });
                              //   },
                              //   child: Center(
                              //       child: Text(
                              //         "Generate Strategy",
                              //         style: primaryFont(
                              //           fontWeight: FontWeight.w300,
                              //           fontSize: 12.2,
                              //           color: AppColors.textWhite,
                              //         ),
                              //         maxLines: 1,
                              //         overflow: TextOverflow.ellipsis,
                              //       ),
                              //     ),
                              //
                              // ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "${completed.toString().padLeft(2, '0')}/",
                                  style: primaryFont(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 35.59,
                                    height: 1.0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                                TextSpan(
                                  text: "$total Tasks",
                                  style: primaryFont(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16,
                                    height: 1.0,
                                    letterSpacing: -0.24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// XP text stays on the right
              Text(
                "$xp XP",
                style: primaryFont(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  height: 1.0,
                  letterSpacing: -0.17,
                  color: progressColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () async {
                  if (index == 0) {
                    print("Tapped SEO Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to SeoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => SeoStrategyScreen(businessId: Helper.businessId),
                    );
                  }
                  if (index == 1) {
                    print("Tapped SEm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitSEMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to SeoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => SemStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                  if (index == 2) {
                    print("Tapped Smm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitSMMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to SmmoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => SmmStrategyScreen(businessId: Helper.businessId),
                    );
                  }
                   if (index == 3) {
                    print("Tapped Smm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitAEOStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to aeoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => AeoStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                   if (index == 4) {
                    print("Tapped geo Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitGEOStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to geoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => GeoStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                   if (index == 5) {
                    print("Tapped aio Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitAIOStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to geoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => AioStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                   if (index == 6) {
                    print("Tapped sxo Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitSXOStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to sxoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => SxoStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                   if (index == 7) {
                    print("Tapped cm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitCMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to cmStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => CMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                     if (index == 8) {
                    print("Tapped em Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitEMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to emStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => EMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 9) {
                    print("Tapped im Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitIMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to emStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => IMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 10) {
                    print("Tapped am Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitAMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to emStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => AMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 11) {
                    print("Tapped vm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitVMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to vmStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => VMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 12) {
                    print("Tapped mm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitMMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to mmStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => MMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 13) {
                    print("Tapped orm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitORMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to ormStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => ORMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 14) {
                    print("Tapped cro Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitCROStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to croStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => CROStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 15) {
                    print("Tapped wat Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitWATStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to watStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => WATStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 16) {
                    print("Tapped ppc Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitPPCStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to ppcStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => PPCStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                         if (index == 17) {
                    print("Tapped pa Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitPAStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to paStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => PAStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                    if (index == 18) {
                    print("Tapped rr Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitRRStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to rrStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => RRStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                    if (index == 19) {
                    print("Tapped ls Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitLSStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to lsStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => LSStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                    if (index == 20) {
                    print("Tapped so Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitVSOStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to vsoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => VSOStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 21) {
                    print("Tapped ma Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitMAStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to maStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => MAStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 22) {
                    print("Tapped chatm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitCHATBOTMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to chatStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => CHATMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 23) {
                    print("Tapped commum Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitCOMMUNITYMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to commuStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => CommunityMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                      if (index == 24) {
                    print("Tapped dp Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitDPStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to dpStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => DPStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                       if (index == 25) {
                    print("Tapped wvem Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitWVEMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to wvemStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => WVEMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                       if (index == 26) {
                    print("Tapped swm Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitSWMStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to swmStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => SWMStrategyScreen(businessId: Helper.businessId),
                    );
                  }

                       if (index == 27) {
                    print("Tapped lpo Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitLPOStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to lpoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => LPOStrategyScreen(businessId: Helper.businessId),
                    );
                  }
                  
                       if (index == 28) {
                    print("Tapped fbao Strategy at: ${DateTime.now()}");

                    CoustomLoadingHelper.show();

                    try {
                      await seostatergyController.submitFBAOStrategy();
                    } catch (e) {
                      print("Error submitting strategy: $e");
                    } finally {
                      CoustomLoadingHelper.hide();
                    }

                    print(
                      "Navigating to fbaoStrategyScreen at: ${DateTime.now()}",
                    );
                    Get.to(
                      () => FBAOStrategyScreen(businessId: Helper.businessId),
                    );
                  }
                  
                },
                child: Text(
                  "Generate Statregy",
                  style: primaryFont(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textWhite,
                  ),
                ),
              ),
            ],
          ),

          /// Progress Bar
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 13,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress.clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: progressColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
