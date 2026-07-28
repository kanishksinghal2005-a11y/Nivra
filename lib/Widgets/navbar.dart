import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const Navbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,

      type: BottomNavigationBarType.fixed,

      selectedItemColor: const Color(0xff1554D1),
      unselectedItemColor: Colors.grey,

      selectedFontSize: 12,
      unselectedFontSize: 12,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined),
          activeIcon: Icon(Icons.assignment),
          label: "Complaints",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          activeIcon: Icon(Icons.notifications),
          label: "Notifications",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}