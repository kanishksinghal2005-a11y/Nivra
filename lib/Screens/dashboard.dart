import 'package:flutter/material.dart';
import 'package:nivra/Widgets/navbar.dart';
import 'package:nivra/Widgets/quick_action_card.dart';
import 'package:nivra/widgets/dashboard_appbar.dart';
import 'package:nivra/widgets/statistics_card.dart';
import 'package:nivra/widgets/recent_activity_card.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// Dashboard App Bar
              const DashboardAppBar(),

              /// Quick Actions
              Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,

                  children: [

                    QuickActionCard( icon: Icons.add,
                      title: "New\nComplaint",
                      backgroundColor: const Color(0xff1554D1),
                      iconBackgroundColor: Colors.white24,
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      onTap: () {},),

                    QuickActionCard(
                      icon: Icons.track_changes_outlined,
                      title: "Complaint\nStatus",
                      backgroundColor: Colors.white,
                      iconBackgroundColor: const Color(0xffEDF3FF),
                      iconColor: const Color(0xff1554D1),
                      textColor: Colors.black,
                      onTap: () {},
                    ),

                    QuickActionCard(
                      icon: Icons.history,
                      title: "History",
                      backgroundColor: Colors.white,
                      iconBackgroundColor: const Color(0xffEDF3FF),
                      iconColor: const Color(0xff1554D1),
                      textColor: Colors.black,
                      onTap: () {},
                    ),

                    QuickActionCard(
                      icon: Icons.person_outline,
                      title: "Profile",
                      backgroundColor: Colors.white,
                      iconBackgroundColor: const Color(0xffEDF3FF),
                      iconColor: const Color(0xff1554D1),
                      textColor: Colors.black,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              /// Statistics Section
              const Padding(
  padding: EdgeInsets.symmetric(horizontal: 16),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "Statistics",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 16),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Row(
    children: [

      Expanded(
        child: StatisticsCard(
          title: "Pending",
          value: "12",
          valueColor: Colors.orange,
        ),
      ),

      const SizedBox(width: 12),

      Expanded(
        child: StatisticsCard(
          title: "Resolved",
          value: "48",
          valueColor: Colors.green,
        ),
      ),

    ],
  ),
),

const SizedBox(height: 12),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Row(
    children: [

      Expanded(
        child: StatisticsCard(
          title: "In Progress",
          value: "7",
          valueColor: Colors.blue,
        ),
      ),

      const SizedBox(width: 12),

      Expanded(
        child: StatisticsCard(
          title: "Total",
          value: "67",
          valueColor: Colors.black,
        ),
      ),

    ],
  ),
),

const SizedBox(height: 30),
              /// (We'll add StatisticsCard widgets here next.)

              const SizedBox(height: 30),
              const Padding(
  padding: EdgeInsets.symmetric(horizontal: 16),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "Recent Activity",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 16),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Column(
    children: [

      RecentActivityCard(
        title: "Water Supply Issue",
        category: "Utilities",
        date: "Today • 10:30 AM",
        status: "Pending",
        statusColor: Colors.orange,
        onTap: () {},
      ),

      SizedBox(height: 14),

      RecentActivityCard(
        title: "Road Damage",
        category: "Infrastructure",
        date: "Yesterday • 4:15 PM",
        status: "Resolved",
        statusColor: Colors.green,
        onTap: () {},
      ),

    ],
  ),
),

const SizedBox(height: 30),

            ],
          ),
        ),
      ),
       floatingActionButton: FloatingActionButton(
    onPressed: () {
      // Open camera
    },
    backgroundColor: const Color(0xff1554D1),
    elevation: 6,
    child: const Icon(
      Icons.camera_alt,
      color: Colors.white,
    ),
  ),

  floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      bottomNavigationBar: Navbar(
  currentIndex: 0,
  onTap: (index) {
    // Navigation will be added later
  },
),
    );
  }
}