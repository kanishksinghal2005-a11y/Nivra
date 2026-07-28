import 'package:flutter/material.dart';

import 'package:nivra/Screens/Onboarding/onboarding1.dart';
import 'package:nivra/Screens/Onboarding/onboarding2.dart';
import 'package:nivra/Screens/Onboarding/onboarding3.dart';
import 'package:nivra/Screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    }
  }

  void skip() {
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
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: Column(
          children: [

            /// Skip
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 20,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: skip,
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            /// Pages
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: const [

                  Onboarding1(),

                  Onboarding2(),

                  Onboarding3(),

                ],
              ),
            ),

            /// Bottom Area
            Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                0,
                24,
                30,
              ),
              child: Row(
                children: [

                  /// Indicators
                  Row(
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        margin: const EdgeInsets.only(
                          right: 8,
                        ),
                        height: 8,
                        width:
                            currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? const Color(0xff2962FF)
                              : Colors.grey.shade300,
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  /// Button
                  SizedBox(
                    width: 150,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xff2962FF),
                        foregroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [

                          Text(
                            currentPage == 2
                                ? "Get Started"
                                : "Next",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),

                          if (currentPage != 2)
                            const SizedBox(width: 8),

                          if (currentPage != 2)
                            const Icon(
                              Icons.arrow_forward_rounded,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}