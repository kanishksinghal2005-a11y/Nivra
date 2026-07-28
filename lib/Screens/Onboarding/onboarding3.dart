import 'package:flutter/material.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
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
              "Assets/onboard3.png",
              fit: BoxFit.contain,
            ),
          ),
        ),

        const SizedBox(height: 40),

        /// Heading
        const Text(
          "Resolution Made Simple.",
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Experience the comfort of a structured path\n"
            "to clarity. Track your\n"
            "progress until your concern is fully resolved.",
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
    );
  }
}