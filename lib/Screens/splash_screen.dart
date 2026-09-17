import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nivra/Screens/Auth/login_screen.dart';
import 'package:nivra/Screens/Dashboard/dashboard.dart';
import 'package:nivra/Screens/Onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkAppState();
  }

  Future<void> checkAppState() async {

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final prefs = await SharedPreferences.getInstance();

    final bool onboardingCompleted =
        prefs.getBool('onboarding_completed') ?? false;

    final User? user =
        FirebaseAuth.instance.currentUser;

    if (!mounted) return;

    // First time user
    if (!onboardingCompleted) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        ),
      );

      return;
    }

    // Returning user already logged in
    if (user != null) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        ),
      );

      return;
    }

    // Returning user but not logged in
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child: Center(

          child: Column(

            mainAxisAlignment:
                MainAxisAlignment.center,

            children: [

              Hero(
                tag: "Logo",

                child: Image.asset(
                  "Assets/logo.png",
                  width: 120,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Nivra",
                                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "The Smarter Way Forward",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey,
                ),
              ),

              const SizedBox(height: 40),

              const CircularProgressIndicator(
                color: Color(0xff2962FF),
              ),

            ],
          ),
        ),
      ),
    );
  }
}