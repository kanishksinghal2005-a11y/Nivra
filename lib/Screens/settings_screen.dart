import 'package:flutter/material.dart';

import 'package:nivra/Screens/Auth/login_screen.dart';
import 'package:nivra/services/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final AuthService _authService = AuthService();

  Future<void> logout(BuildContext context) async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text("Logout"),
          content: const Text(
            "Are you sure you want to logout?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (confirm != true) return;

    await _authService.logout();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  Widget settingTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    Color iconColor = const Color(0xff1554D1),
    Color? textColor,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: const Color(0xffEDF3FF),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor ?? Colors.black,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            settingTile(
              icon: Icons.person_outline,
              title: "Profile",
              onTap: () {},
            ),

            settingTile(
              icon: Icons.notifications_none,
              title: "Notifications",
              onTap: () {},
            ),

            settingTile(
              icon: Icons.lock_outline,
              title: "Privacy & Security",
              onTap: () {},
            ),
                        settingTile(
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () {},
            ),

            settingTile(
              icon: Icons.info_outline,
              title: "About NIVRA",
              onTap: () {},
            ),

            const SizedBox(height: 10),

            settingTile(
              icon: Icons.logout_rounded,
              title: "Logout",
              iconColor: Colors.red,
              textColor: Colors.red,
              onTap: () => logout(context),
            ),

            const Spacer(),

            const Column(
              children: [

                Text(
                  "NIVRA",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1554D1),
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  "Version 1.0.0",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "© 2026 NIVRA. All rights reserved.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),

                SizedBox(height: 20),

              ],
            ),

          ],
        ),
      ),
    );
  }
}