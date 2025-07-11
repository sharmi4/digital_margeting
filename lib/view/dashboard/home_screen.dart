import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/sqlite_database/sqlite_database_helper.dart';
import 'package:digital_marketing_stratergy/view/menu/stratergy_details/stratery_selection_list.dart';
import 'package:flutter/material.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> sData = [];
  List<Map<String, dynamic>> semData = [];
  List<Map<String, dynamic>> smmData = [];
  List<Map<String, dynamic>> aeoData = [];
  List<Map<String, dynamic>> geoData = [];
  List<Map<String, dynamic>> aioData = [];
  List<Map<String, dynamic>> sxoData = [];
  List<Map<String, dynamic>> cmData = [];
  List<Map<String, dynamic>> emData = [];
  List<Map<String, dynamic>> imData = [];
  List<Map<String, dynamic>> amData = [];
  List<Map<String, dynamic>> vmData = [];
  List<Map<String, dynamic>> mmData = [];
  List<Map<String, dynamic>> ormData = [];
  List<Map<String, dynamic>> croData = [];
  List<Map<String, dynamic>> watData = [];
  List<Map<String, dynamic>> ppcData = [];
  List<Map<String, dynamic>> paData = [];
  List<Map<String, dynamic>> rrData = [];
  List<Map<String, dynamic>> lsData = [];
  List<Map<String, dynamic>> vsoData = [];
  List<Map<String, dynamic>> maData = [];
  List<Map<String, dynamic>> chatmData = [];
  List<Map<String, dynamic>> commumData = [];
  List<Map<String, dynamic>> dpData = [];
    List<Map<String, dynamic>> wvemData = [];
      List<Map<String, dynamic>> swmData = [];

          List<Map<String, dynamic>> lpoData = [];
             List<Map<String, dynamic>> fbaoData = [];
  DateTime selectedDate = DateTime.now();

  void getbyDate() async {
    final rawData = await DatabaseHelper().getSeoTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    sData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

  void getsembyDate() async {
    final rawData = await DatabaseHelper().getSEMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    semData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

  void getsmmbyDate() async {
    final rawData = await DatabaseHelper().getSMMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    smmData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

  void getaeobyDate() async {
    final rawData = await DatabaseHelper().getAEOTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    aeoData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

  void getgeobyDate() async {
    final rawData = await DatabaseHelper().getGEOTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    geoData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }


    void getaiobyDate() async {
    final rawData = await DatabaseHelper().getAIOTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    aioData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

      void getsxobyDate() async {
    final rawData = await DatabaseHelper().getSXOTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    sxoData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

  void getcmbyDate() async {
    final rawData = await DatabaseHelper().getCMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    cmData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

    void getembyDate() async {
    final rawData = await DatabaseHelper().getEMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    emData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

    void getimbyDate() async {
    final rawData = await DatabaseHelper().getIMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    imData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

    void getambyDate() async {
    final rawData = await DatabaseHelper().getAMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    amData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

    void getvmbyDate() async {
    final rawData = await DatabaseHelper().getVMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    vmData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

      void getmmbyDate() async {
    final rawData = await DatabaseHelper().getMMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    mmData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

        void getormbyDate() async {
    final rawData = await DatabaseHelper().getORMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    ormData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }


           void getcrobyDate() async {
    final rawData = await DatabaseHelper().getCROTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    croData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

             void getwatbyDate() async {
    final rawData = await DatabaseHelper().getWATTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    watData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

  void getppcbyDate() async {
    final rawData = await DatabaseHelper().getPPCTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    ppcData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

    void getpabyDate() async {
    final rawData = await DatabaseHelper().getPATaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    paData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

    void getrrbyDate() async {
    final rawData = await DatabaseHelper().getRRTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    rrData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

    void getlsbyDate() async {
    final rawData = await DatabaseHelper().getLSTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    lsData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

      void getvsobyDate() async {
    final rawData = await DatabaseHelper().getVSOTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    vsoData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

        void getmabyDate() async {
    final rawData = await DatabaseHelper().getMATaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    maData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

          void getchatmbyDate() async {
    final rawData = await DatabaseHelper().getCHATMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    chatmData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

            void getcommumbyDate() async {
    final rawData = await DatabaseHelper().getCOMMUMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    commumData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

              void getdpbyDate() async {
    final rawData = await DatabaseHelper().getDPTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    dpData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

                void getwvembyDate() async {
    final rawData = await DatabaseHelper().getWVEMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    wvemData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }
        
                  void getswmbyDate() async {
    final rawData = await DatabaseHelper().getSWMTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    swmData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

                    void getlpobyDate() async {
    final rawData = await DatabaseHelper().getLPOTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    lpoData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

                      void getfbaobyDate() async {
    final rawData = await DatabaseHelper().getFBAOTaskByDate(
      selectedDate.toString().split(" ")[0],
    );

    // Remove duplicates based on 'taskname'
    final seen = <String>{};
    fbaoData = rawData.where((element) => seen.add(element['taskname'])).toList();

    setState(() {});
  }

  bool loading = false;
  @override
  void initState() {
    super.initState();
    getbyDate();
    getsembyDate();
    getsmmbyDate();
    getaeobyDate();
    getgeobyDate();
    getaiobyDate();
    getsxobyDate();
    getcmbyDate();
    getembyDate();
    getimbyDate();
    getambyDate();
    getvmbyDate();
    getmmbyDate();
    getormbyDate();
    getcrobyDate();
    getwatbyDate();
    getppcbyDate();
    getpabyDate();
    getrrbyDate();
    getlsbyDate();
    getvsobyDate();
    getmabyDate();
    getchatmbyDate();
    getcommumbyDate();
    getdpbyDate();
    getwvembyDate();
    getswmbyDate();
    getlpobyDate();
    getfbaobyDate();
      }

  @override
  Widget build(BuildContext context) {
    final completedTasks =
        sData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedsemTasks =
        semData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedsmmTasks =
        smmData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedaeoTasks =
        aeoData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedgeoTasks =
        geoData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedaioTasks =
        aioData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedsxoTasks =
        sxoData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedcmTasks =
        cmData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedemTasks =
        emData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedimTasks =
        imData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedamTasks =
        amData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedvmTasks =
        vmData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedmmTasks =
        mmData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedormTasks =
        ormData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedcroTasks =
        croData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedwatTasks =
        watData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedppcTasks =
        ppcData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedpaTasks =
        paData.where((task) => task["iscompleted"].toString() == '1').toList();
        final completedrrTasks =
        rrData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedlsTasks =
        lsData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedvsoTasks =
        vsoData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedmaTasks =
        maData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedchatmTasks =
        chatmData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedcommumTasks =
        commumData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completeddpTasks =
        dpData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedwvemTasks =
        wvemData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedswmTasks =
        swmData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedlpoTasks =
        lpoData.where((task) => task["iscompleted"].toString() == '1').toList();
         final completedfbaoTasks =
        fbaoData.where((task) => task["iscompleted"].toString() == '1').toList();



    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "XYZ Business",
              style: primaryFont(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                height: 1.2,
                letterSpacing: -0.17,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
              size: 20,
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildCalendarCard(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today Tasks",
                  style: primaryFont(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    height: 14.64 / 14,
                    letterSpacing: -0.13,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "View All",
                      style: primaryFont(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        height: 1.0,
                        letterSpacing: -0.13,
                        color: AppColors.blue,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: AppColors.blue,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
       // SEO
                      if (completedTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/seo.png",
                                taskName: completedTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                      // SEM
                      if (completedsemTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedsemTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/sem.png",
                                taskName: completedsemTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                      // SMM
                      if (completedsmmTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedsmmTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/images/social.png",
                                taskName: completedsmmTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                      // AEO
                      if (completedaeoTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedaeoTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/aeo.png",
                                taskName: completedaeoTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),
                        // GEO
                      if (completedgeoTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedgeoTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/geo.png",
                                taskName: completedgeoTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),
                         // AIO
                      if (completedaioTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedaioTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/aio.png",
                                taskName: completedaioTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                            // SXO
                      if (completedsxoTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedsxoTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/sxo.png",
                                taskName: completedsxoTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                              // CM
                      if (completedcmTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedcmTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/images/content_creation.png",
                                taskName: completedcmTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                      // EM
                      if (completedemTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedemTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/images/email.png",
                                taskName: completedemTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),
                        
                        // IM
                        if (completedimTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedimTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/im.png",
                                taskName: completedimTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                            
                        // AM
                        if (completedamTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedamTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/im.png",
                                taskName: completedamTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),
                        
                          // VM
                        if (completedvmTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedvmTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/vm.png",
                                taskName: completedvmTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                // MM
                        if (completedmmTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedmmTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/mm.png",
                                taskName: completedmmTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                          if (completedormTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedormTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/orm.png",
                                taskName: completedormTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                             if (completedcroTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedcroTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/cro.png",
                                taskName: completedcroTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                             if (completedwatTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedwatTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/wat.png",
                                taskName: completedwatTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                            if (completedppcTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedppcTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/ppca.png",
                                taskName: completedppcTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                              if (completedpaTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedpaTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/pa.png",
                                taskName: completedpaTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                        if (completedrrTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedrrTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/Retargeting.png",
                                taskName: completedrrTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                          if (completedlsTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedlsTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/localseo.png",
                                taskName: completedlsTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                          if (completedvsoTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedvsoTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/vso.png",
                                taskName: completedvsoTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                if (completedmaTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedmaTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/ma.png",
                                taskName: completedmaTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                       if (completedchatmTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedchatmTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/ca.png",
                                taskName: completedchatmTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                         if (completedcommumTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedcommumTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/com.png",
                                taskName: completedcommumTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                           if (completeddpTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completeddpTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/dpr.png",
                                taskName: completeddpTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                               if (completedwvemTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedwvemTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/wvem.png",
                                taskName: completedwvemTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                                 if (completedswmTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedswmTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/swm.png",
                                taskName: completedswmTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                                  if (completedlpoTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedlpoTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/lpo.png",
                                taskName: completedlpoTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                                                  if (completedfbaoTasks.isNotEmpty)
                        ListView.builder(
                          itemCount: completedfbaoTasks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: TaskRow(
                                iconPath: "assets/icons/fbo.png",
                                taskName: completedfbaoTasks[index]["taskname"],
                              ),
                            );
                          },
                        ),

                


            const SizedBox(height: 24),
            _buildDailyProgressCard(),
            const SizedBox(height: 24),
            _buildTaskCategories(),
            const SizedBox(height: 12),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        mini: true, // reduces size
        elevation: 1,
        onPressed: () {
          Get.to(StrategySelectionListScreen());
        },
        child: Icon(Icons.add, color: AppColors.textWhite),
        tooltip: 'Add',
      ),
    );
  }

  Widget _buildCalendarCard() {
    return GestureDetector(
      onTap: () async {
        // final DateTime? pickedDate = await showDatePicker(
        //   context: context,
        //   initialDate: selectedDate,
        //   firstDate: DateTime(2000),
        //   lastDate: DateTime(2100),
        // );
        // if (pickedDate != null) {
        //   setState(() {
        //     selectedDate = pickedDate;
        //   });
        //    getbyDate();
        // }
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFE6F1FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/icons/Rectangle 21.png", height: 36),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Calendar",
                      style: primaryFont(
                        fontWeight: FontWeight.w300,
                        fontSize: 11,
                        height: 1.8,
                        letterSpacing: -0.17,
                        color: const Color(0xFF7D7D7D),
                      ),
                    ),
                    Text(
                      "${selectedDate.day.toString().padLeft(2, '0')}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.year}, ${_weekdayName(selectedDate.weekday)}",
                      style: primaryFont(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        height: 1.2,
                        letterSpacing: -0.17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  String _weekdayName(int weekday) {
    const weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    return weekdays[weekday - 1];
  }

  Widget _buildDailyProgressCard() {
    int completed = 5;
    int total = 14;
    double progress = completed / total;

    return Container(
      height: 130,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2196F3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row: Icon + Info + XP
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/daily-task.png",
                    height: 50,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daily Tasks",
                        style: primaryFont(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.2,
                          height: 14.64 / 12.2,
                          letterSpacing: -0.13,
                          color: AppColors.textWhite,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "05/",
                                style: primaryFont(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 35.59,
                                  height: 1.0,
                                  letterSpacing: -0.24,
                                  color: AppColors.textWhite,
                                ),
                              ),
                              TextSpan(
                                text: "14",
                                style: primaryFont(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16.0,
                                  height: 1.0,
                                  letterSpacing: -0.24,
                                  color: AppColors.textWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "125",
                    style: primaryFont(
                      fontWeight: FontWeight.w800,
                      fontSize: 36,
                      height: 1.0,
                      letterSpacing: -0.17,
                      color: AppColors.yellow,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: 2,
                      width: 120,
                      color: Colors.black12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "1875 XP",
                      style: primaryFont(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        height: 1.0,
                        letterSpacing: -0.17,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ],
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
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3), // Track color
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress, // e.g. 5/14
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
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

  Widget _buildTaskCategories() {
    final categories = [
      {"title": "GMB", "icon": "assets/icons/gmb.png", "color": Colors.red},
      {
        "title": "SEO",
        "icon": "assets/icons/anlysis.png",
        "color": Colors.blue,
      },
      {
        "title": "Influencer",
        "icon": "assets/icons/im.png",
        "color": Colors.purple,
      },
      {
        "title": "Performance",
        "icon": "assets/icons/performance.png",
        "color": Colors.green,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Task Categories",
              style: primaryFont(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                height: 14.64 / 14,
                letterSpacing: -0.13,
              ),
            ),
            Row(
              children: [
                Text(
                  "View All",
                  style: primaryFont(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    height: 1.0,
                    letterSpacing: -0.13,
                    color: AppColors.blue,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: AppColors.blue,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              categories.map((cat) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Center(
                          child: Image.asset(
                            cat["icon"] as String,
                            fit: BoxFit.contain,
                            height: 60,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      cat["title"] as String,
                      style: primaryFont(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        height: 1.0, // 100% line-height
                        letterSpacing: -0.13,
                        // textAlign is set on the Text widget, not in TextStyle
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ],
    );
  }
}

class TaskRow extends StatelessWidget {
  final String iconPath;
  final String taskName;

  const TaskRow({Key? key, required this.iconPath, required this.taskName})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Check Icon
              CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.blue,
                child: Icon(Icons.check, size: 18, color: AppColors.textWhite),
              ),

              // Task Info
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    children: [
                      Image.asset(
                        iconPath,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          taskName,
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "20XP",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Play Icon
              CircleAvatar(
                radius: 15,
                backgroundColor: const Color(0xFFE6F1FF),
                child: Icon(
                  Icons.play_arrow_sharp,
                  size: 20,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
