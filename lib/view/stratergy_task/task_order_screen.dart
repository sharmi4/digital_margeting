import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskOrdersScreen extends StatefulWidget {
  const TaskOrdersScreen({Key? key}) : super(key: key);

  @override
  State<TaskOrdersScreen> createState() => _TaskOrdersScreenState();
}

class _TaskOrdersScreenState extends State<TaskOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          "Task Orders",
          style: primaryFont(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            height: 1.2,
            letterSpacing: -0.17,
          ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInProgressTask(),
            const SizedBox(height: 16),
            _buildCompletedTask(),
            const SizedBox(height: 24),
            Text(
              'Previous Order',
              style: primaryFont(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                height: 1.0457,
                letterSpacing: -0.13,
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: 5,
  itemBuilder: (context, index) => _buildPreviousOrderCard(),
),

          ],
        ),
      ),
    );
  }

  Widget _buildInProgressTask() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF9E53D3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/images/timer_image.png"),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task In-Progress',
                      style: primaryFont(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 1.0,
                        letterSpacing: -0.13,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Primary Keywords',
                      style: primaryFont(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        height: 1.0,
                        letterSpacing: -0.13,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "Earn XP",
                          style: primaryFont(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 1.0,
                            letterSpacing: -0.13,
                            color: AppColors.textWhite,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "+50xp",
                            style: primaryFont(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              height: 1.0,
                              letterSpacing: -0.17,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order No #67890',
                style: primaryFont(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.0,
                  letterSpacing: -0.13,
                  color: AppColors.textWhite,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'The task is in progress and will be delivered in 6-7hrs.',
                style: primaryFont(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1.0,
                  letterSpacing: -0.13,
                  color: AppColors.textWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedTask() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD3536D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/images/task_completed.png"),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Completed',
                      style: primaryFont(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 1.0,
                        letterSpacing: -0.13,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Optimize Meta Tags',
                      style: primaryFont(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        height: 1.0,
                        letterSpacing: -0.13,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "Earn XP",
                          style: primaryFont(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 1.0,
                            letterSpacing: -0.13,
                            color: AppColors.textWhite,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "+50xp",
                            style: primaryFont(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              height: 1.0,
                              letterSpacing: -0.17,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order No #12345',
                style: primaryFont(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.0,
                  letterSpacing: -0.13,
                  color: AppColors.textWhite,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'The task has been completed and delivered.',
                style: primaryFont(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1.0,
                  letterSpacing: -0.13,
                  color: AppColors.textWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPreviousOrderCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(10)
        ),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.blue,
            child: Icon(Icons.check, color: Colors.white),
          ),
          title:  Row(
            children: [
              Text('Order No #12345',
              style: primaryFont(
                fontWeight: FontWeight.w600, // normal weight
                fontSize: 14,
                height: 1.0, // line-height 100% translates to height = 1.0
                letterSpacing: -0.13,
              ),),
                 Padding(
                   padding: const EdgeInsets.only(left: 2),
                   child: Container(
                               height: 25,
                               width: 50,
                                  
                                  decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "+50xp",
                                      style: primaryFont(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        height: 1.0,
                                        letterSpacing: -0.17,
                                      ),
                                    ),
                                  ),
                                ),
                 ),
            ],
          ),
          subtitle:  Text('Optimize Meta tags',
          style: primaryFont(
            fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 1.0,          // line-height: 100%
          letterSpacing: -0.13, // letter-spacing: -0.13px
          ),),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
            
              SizedBox(height: 4),
              Text(
                '₹496/-',
                style: primaryFont(
                  fontWeight: FontWeight.w700, // Bold
          fontSize: 14,
          height: 1.0,          // line-height: 100%
          letterSpacing: -0.13,
          color: AppColors.darkyellow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
