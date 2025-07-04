import 'package:digital_marketing_stratergy/const/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LeaderboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> leaderboard = List.generate(
    20,
    (index) => {
      "name": "Johnson Doe",
      "xp": "500XP",
      "rank": index + 4,
      "image": "assets/images/leader1.png"
    },
  );

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
              "Leaderboard",
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
      body: Column(
        children: [
          const SizedBox(height: 10),
          _TopThreeWinners(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: leaderboard.length,
              itemBuilder: (context, index) {
                final user = leaderboard[index];
                return ListTile(
                  leading: Text("${user['rank']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(user['image']),
                      ),
                      const SizedBox(width: 8),
                      Text(user['name']),
                    ],
                  ),
                  trailing: Text(user['xp']),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _TopThreeWinners extends StatelessWidget {
  final List<Map<String, dynamic>> topThree = [
    {
      "name": "Full Name",
      "xp": "500XP",
      "rank": "assets/images/lea_rank2.png",
      "image": "assets/images/leader1.png"
    },
    {
      "name": "Full Name",
      "xp": "500XP",
      "rank": "assets/images/leader_rank3.png",
      "image": "assets/images/leader_board2.png"
    },
    {
      "name": "Full Name",
      "xp": "500XP",
      "rank": "assets/images/lead_rank3.png",
      "image": "assets/images/leader_board3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        final user = topThree[index];
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                 CircleAvatar(
      radius: index == 1 ? 50 : 36, // Bigger for center
      backgroundColor: Colors.amber,
      child: CircleAvatar(
        radius: index == 1 ? 60 : 32, // Inner image slightly smaller
        backgroundImage: AssetImage(user['image']),
      ),
    ),

                Positioned(
                  bottom: -4,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: Image.asset(user["rank"])
                  ),
                )
              ],
            ),
             SizedBox(height: 6),
            Text(user['name'],
            style: primaryFont(
               fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 14.64 / 14, // This gives the correct line-height ratio
    letterSpacing: -0.13,
            ),),
            Text(user['xp'],
            style: primaryFont(fontWeight: FontWeight.w300,
    fontSize: 14,
    height: 14.64 / 14, // = 1.0457
    letterSpacing: -0.13,),),
          ],
        );
      }),
    );
  }
}
