import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() =>
      _ForgotPasswordState();
}

class _ForgotPasswordState
    extends State<ForgotPassword> {

  final TextEditingController emailController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF6F8FC),

      

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(22),

          child: Container(

            width: double.infinity,

            padding: const EdgeInsets.all(24),

            decoration: BoxDecoration(

              color: Colors.white,

              borderRadius:
                  BorderRadius.circular(28),

              boxShadow: [

                BoxShadow(

                  color: Colors.grey.shade200,

                  blurRadius: 18,

                  offset: const Offset(0, 8),

                ),

              ],

            ),

            child: Column(

              children: [

                const SizedBox(height: 10),

                Image.asset(
                  "Assets/forgot.png",
                  height: 180,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 28),

                const Text(

                  "Forgot Password?",

                  style: TextStyle(

                    fontSize: 30,

                    fontWeight: FontWeight.bold,

                    color: Color(0xff212121),

                  ),
                ),

                const SizedBox(height: 16),

                const Text(

                  "Enter your email to receive a\nsecure password reset link.",

                  textAlign: TextAlign.center,

                  style: TextStyle(

                    fontSize: 16,

                    height: 1.5,

                    color: Colors.grey,

                  ),
                ),

                const SizedBox(height: 34),

                Align(

                  alignment: Alignment.centerLeft,

                  child: Text(

                    "Email Address",

                    style: TextStyle(

                      fontSize: 16,

                      fontWeight: FontWeight.w600,

                      color: Colors.grey.shade800,

                    ),

                  ),

                ),

                const SizedBox(height: 10),

                TextField(

                  controller: emailController,

                  keyboardType:
                      TextInputType.emailAddress,

                  decoration: InputDecoration(

                    hintText: "e.g. alex@example.com",

                    prefixIcon: const Icon(
                      Icons.mail_outline,
                    ),

                    filled: true,

                    fillColor:
                        const Color(0xffF7F8FC),

                    contentPadding:
                        const EdgeInsets.symmetric(
                      vertical: 18,
                    ),

                    border: OutlineInputBorder(

                      borderRadius:
                          BorderRadius.circular(18),

                      borderSide:
                          BorderSide.none,

                    ),

                    enabledBorder:
                        OutlineInputBorder(

                      borderRadius:
                          BorderRadius.circular(18),

                      borderSide: BorderSide(

                        color:
                            Colors.grey.shade300,

                      ),

                    ),

                    focusedBorder:
                        OutlineInputBorder(

                      borderRadius:
                          BorderRadius.circular(18),

                      borderSide: const BorderSide(

                        color:
                            Color(0xff2962FF),

                        width: 1.5,

                      ),

                    ),

                  ),

                ),

                const SizedBox(height: 32),

                SizedBox(

                  width: double.infinity,

                  height: 58,

                  child: ElevatedButton(

                    onPressed: () {

                    },

                    style:
                        ElevatedButton.styleFrom(

                      backgroundColor:
                          const Color(0xff1554D1),

                      foregroundColor:
                          Colors.white,

                      shape:
                          RoundedRectangleBorder(

                        borderRadius:
                            BorderRadius.circular(18),

                      ),

                    ),

                    child: const Row(

                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        Text(

                          "Send Reset Link",

                          style: TextStyle(

                            fontSize: 17,

                            fontWeight:
                                FontWeight.w600,

                          ),

                        ),

                        SizedBox(width: 10),

                        Icon(
                          Icons.arrow_forward,
                        ),

                      ],

                    ),

                  ),

                ),
                                const SizedBox(height: 30),

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back to Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1554D1),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

              ],
            ),
          ),
        ),
      ),
    );
  }
}