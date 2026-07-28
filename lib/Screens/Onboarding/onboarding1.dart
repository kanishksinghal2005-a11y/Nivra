import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),

          /// Illustration
          Container(
            height: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                "Assets/onboard1.png",
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 40),

          /// Heading
          const Text(
            "Solutions Before You\nComplain.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121),
              height: 1.15,
            ),
          ),

          const SizedBox(height: 20),

          /// Description
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Describe your issue and let Nivra\n"
              "guide you through a seamless,\n"
              "stress-free resolution experience.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}