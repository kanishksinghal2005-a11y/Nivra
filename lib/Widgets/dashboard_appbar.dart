import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Profile Picture
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage("Assets/profile.jpeg"),
          ),

          const SizedBox(width: 14),

          /// Greeting
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [

                Text(
                  "WELCOME BACK",
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 1,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "Good Morning,\nKanishk 👋",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),

          /// Notification Button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),

          /// Settings Button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
    );
  }
}