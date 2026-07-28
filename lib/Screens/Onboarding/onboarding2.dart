import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          children: [
            /// Skip Button
            Align(
              alignment: Alignment.topRight,
              // child: TextButton(
              //   onPressed: () {
              //     // TODO: Skip to Login
              //   },
              //   child: const Text(
              //     "Skip",
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w600,
              //       color: Colors.black87,
              //     ),
              //   ),
              // ),
            ),

            const SizedBox(height: 20),

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
                  "Assets/onboard2.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// Heading
            const Text(
              "Partnering For Results.",
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
                "We bridge the gap between your\n"
                "problem and the right solution,\n"
                "ensuring every voice is heard and \n"
                "every issue is addressed.\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade600,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 70),

            /// Bottom Navigation
            // Row(
            //   children: [
            //     /// Page Indicator
            //     Row(
            //       children: [
            //         _activeDot(),
            //         const SizedBox(width: 8),
            //         _inactiveDot(),
            //         const SizedBox(width: 8),
            //         _inactiveDot(),
            //       ],
            //     ),

            //     const Spacer(),

            //     /// Next Button
            //     SizedBox(
            //       width: 145,
            //       height: 56,
            //       child: ElevatedButton(
            //         onPressed: () {
            //           // TODO: Navigate to Onboarding 2
            //         },
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: const Color(0xFF2962FF),
            //           foregroundColor: Colors.white,
            //           elevation: 5,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(18),
            //           ),
            //         ),
            //         child: const Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               "Next",
            //               style: TextStyle(
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             ),
            //             SizedBox(width: 8),
            //             Icon(Icons.arrow_forward_rounded),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            const SizedBox(height: 25),
          ],
      
    );
  }

  // static Widget _activeDot() {
  //   return Container(
  //     width: 24,
  //     height: 8,
  //     decoration: BoxDecoration(
  //       color: const Color(0xFF2962FF),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //   );
  // }

  // static Widget _inactiveDot() {
  //   return Container(
  //     width: 8,
  //     height: 8,
  //     decoration: const BoxDecoration(
  //       color: Color(0xFFD6D6D6),
  //       shape: BoxShape.circle,
  //     ),
  //   );
  }
