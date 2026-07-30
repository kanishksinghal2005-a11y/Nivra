import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:nivra/Screens/settings_screen.dart';

class DashboardAppBar extends StatefulWidget {
  const DashboardAppBar({super.key});

  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();
}

class _DashboardAppBarState extends State<DashboardAppBar> {
  String userName = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        setState(() {
          userName = "User";
          isLoading = false;
        });
        return;
      }

      final DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (document.exists) {
        final data = document.data() as Map<String, dynamic>;

        setState(() {
          userName = data['fullName'] ?? "User";
          isLoading = false;
        });
      } else {
        setState(() {
          userName = "User";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        userName = "User";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(
              "Assets/profile.jpeg",
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "WELCOME BACK",
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 1,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),
                                isLoading
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        "Hello $userName 👋",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ),

          /// Notification Button
          IconButton(
            onPressed: () {
              // TODO: Navigate to Notifications Screen
            },
            icon: const Icon(
              Icons.notifications_none,
            ),
          ),

          /// Settings Button
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.settings_outlined,
            ),
          ),
        ],
      ),
    );
  }
}