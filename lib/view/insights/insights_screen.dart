import 'package:digital_marketing_stratergy/const/app_color.dart';
import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

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
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Row(
          children: [
            Text(
              "Insights",
              style: primaryFont(
                fontWeight: FontWeight.w500,
                fontSize: 16,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderCard(),
            const SizedBox(height: 24),
             Text('Overview Insights', style:primaryFont(
               fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 14.64 / 14, // Convert px line-height to Flutter's height (lineHeight / fontSize)
    letterSpacing: -0.13,
             )),
            const SizedBox(height: 16),
             DiagonalInsightTile(title: 'SEO', percent: 50, color:AppColors.yellow, icon: "assets/icons/Rectangle 24 (13).png",),
             DiagonalInsightTile(title: 'Performance Marketing', percent: 75, color: AppColors.blue, icon: "assets/icons/Rectangle 24 (14).png"),
             DiagonalInsightTile(title: 'Social Media', percent: 57, color: AppColors.yellow, icon: "assets/icons/Rectangle 24 (15).png"),
             DiagonalInsightTile(title: 'Press Releases', percent: 62, color: AppColors.blue, icon: "assets/icons/Rectangle 24 (16).png"),
             DiagonalInsightTile(title: 'Email Marketing', percent: 78, color: AppColors.yellow, icon: "assets/icons/Rectangle 24 (17).png"),
             DiagonalInsightTile(title: 'Whatsapp & SMS', percent: 78, color: AppColors.blue, icon: "assets/icons/Rectangle 24 (18).png"),
             DiagonalInsightTile(title: 'Google My Business', percent: 45, color: AppColors.yellow, icon: "assets/icons/Rectangle 24 (19).png"),
             DiagonalInsightTile(title: 'Video Marketing', percent: 50, color: AppColors.blue, icon: "assets/icons/Rectangle 24 (20).png"),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF008CFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Strategy Plan', style: TextStyle(color: Colors.white70)),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SvgPicture.asset("assets/icons/Refresh.svg",
                height: 15,
                fit: BoxFit.fitHeight,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text("Switch Account",
                style: primaryFont(
                  fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 1.0, // 100% line height
    letterSpacing: -0.13,
                  color: AppColors.yellow,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.yellow
                ),),
              )
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text('XYZ Business', style: primaryFont(
              fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 1.0, // Line height 100%
    letterSpacing: -0.13,
    color: AppColors.textWhite
    )),
              Text('50%', style: TextStyle(color: AppColors.yellow, fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(5),
            minHeight: 15,
            value: 0.5, backgroundColor: Colors.white24, color:AppColors.yellow),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _StatBox(label: 'Days Spent', value: '37'),
              _StatBox(label: 'Experience Points', value: '821'),
              _StatBox(label: 'Tasks Completed', value: '52'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF00A6E3)
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Text(label,textAlign: TextAlign.center, style:primaryFont(
                fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 1.0, // 100% line-height equals 1.0
    letterSpacing: -0.13,
    color: AppColors.textWhite
              )),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(value,textAlign: TextAlign.center, 
              style: primaryFont( fontWeight: FontWeight.w800,
    fontSize: 20,
    height: 1.0, // 100% line-height = 1.0
    letterSpacing: -0.13,
    color: AppColors.textWhite
    )),
            ),
          
          ],
        ),
      ),
    );
  }
}

// ------------------- Custom Insight Tile with Diagonal ----------------------

class DiagonalInsightTile extends StatelessWidget {
  final String title;
  final int percent;
  final Color color;
  final String icon;

  const DiagonalInsightTile({
    super.key,
    required this.title,
    required this.percent,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
  height: 56,
  margin: const EdgeInsets.only(bottom: 12),
  decoration: BoxDecoration(
    color: Colors.grey.shade100,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Row(
    children: [
      // Left slanted background section
      ClipPath(
        clipper: DiagonalClipper(),
        child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Image.asset(
                icon,
                height: 50,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          '$percent%',
          style: primaryFont(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color == AppColors.blue
                ? AppColors.yellow
                : color == AppColors.yellow
                    ? AppColors.blue
                    : AppColors.blue, // fallback color
          ),
        ),
      ),
    ],
  ),
);

  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width - 20, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
