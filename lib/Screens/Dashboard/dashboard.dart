import 'package:flutter/material.dart';
import 'package:nivra/Widgets/navbar.dart';
import 'package:nivra/Widgets/quick_action_card.dart';
import 'package:nivra/widgets/dashboard_appbar.dart';
import 'package:nivra/widgets/statistics_card.dart';
import 'package:nivra/widgets/recent_activity_card.dart';
import '../Complaint/new_complaint_screen.dart';
import 'package:nivra/Screens/History/history_screen.dart';
import 'package:nivra/Screens/Status/complaint_status_screen.dart';
import 'package:nivra/Screens/Profile/profile_screen.dart';
import 'package:nivra/Screens/Notifications/notifications_screen.dart';
import 'package:nivra/models/complaint.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final complaints = ComplaintStore.complaints;

    final pendingCount = complaints.where((c) => c.status == 'Pending').length;

    final resolvedCount = complaints
        .where((c) => c.status == 'Resolved')
        .length;

    final inProgressCount = complaints
        .where((c) => c.status == 'In Progress')
        .length;

    final totalCount = complaints.length;
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
                    QuickActionCard(
                      icon: Icons.add,
                      title: "New\nComplaint",
                      backgroundColor: const Color(0xff1554D1),
                      iconBackgroundColor: Colors.white24,
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewComplaintScreen(),
                          ),
                        ).then((_) {
                          setState(() {});
                        });
                      },
                    ),

                    QuickActionCard(
                      icon: Icons.track_changes_outlined,
                      title: "Complaint\nStatus",
                      backgroundColor: Colors.white,
                      iconBackgroundColor: const Color(0xffEDF3FF),
                      iconColor: const Color(0xff1554D1),
                      textColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ComplaintStatusScreen(),
                          ),
                        );
                      },
                    ),

                    QuickActionCard(
                      icon: Icons.history,
                      title: "History",
                      backgroundColor: Colors.white,
                      iconBackgroundColor: const Color(0xffEDF3FF),
                      iconColor: const Color(0xff1554D1),
                      textColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HistoryScreen(),
                          ),
                        );
                      },
                    ),

                    QuickActionCard(
                      icon: Icons.person_outline,
                      title: "Profile",
                      backgroundColor: Colors.white,
                      iconBackgroundColor: const Color(0xffEDF3FF),
                      iconColor: const Color(0xff1554D1),
                      textColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                        value: pendingCount.toString(),
                        valueColor: Colors.orange,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: StatisticsCard(
                        title: "Resolved",
                        value: resolvedCount.toString(),
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
                        value: inProgressCount.toString(),
                        valueColor: Colors.blue,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: StatisticsCard(
                        title: "Total",
                        value: totalCount.toString(),
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: ComplaintStore.complaints.isEmpty
                      ? [
                          const Text(
                            'No recent complaints',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ]
                      : ComplaintStore.complaints.reversed.take(3).map((
                          complaint,
                        ) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: RecentActivityCard(
                              title: complaint.title,
                              category: 'Complaint',
                              date: complaint.submittedAt.toString(),
                              status: complaint.status,
                              statusColor: complaint.status == 'Resolved'
                                  ? Colors.green
                                  : complaint.status == 'In Progress'
                                  ? Colors.blue
                                  : complaint.status == 'Pending'
                                  ? Colors.orange
                                  : Colors.grey,
                              onTap: () {},
                            ),
                          );
                        }).toList(),
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
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      bottomNavigationBar: Navbar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ComplaintStatusScreen(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsScreen(),
              ),
            );
          }

          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}
