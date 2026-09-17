import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:nivra/services/auth_service.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() =>
      _ForgotPasswordState();
}

class _ForgotPasswordState
    extends State<ForgotPassword> {

  final AuthService _authService = AuthService();

  final TextEditingController emailController =
      TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> sendResetLink() async {

    final String email =
        emailController.text.trim();

    // Check if email is empty
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter your email address",
          ),
        ),
      );
      return;
    }

    // Basic email validation
    if (!email.contains("@") ||
        !email.contains(".")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter a valid email address",
          ),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {

      await _authService.resetPassword(email);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Password reset link sent! Check your email.",
          ),
          duration: Duration(seconds: 4),
        ),
      );

      emailController.clear();

    } on FirebaseAuthException catch (e) {

      if (!mounted) return;

      String message =
          "Unable to send reset link";

      switch (e.code) {

        case "invalid-email":
          message =
              "Please enter a valid email address";
          break;

        case "user-not-found":
          message =
              "No account found with this email";
          break;

        case "too-many-requests":
          message =
              "Too many requests. Please try again later";
          break;

        case "network-request-failed":
          message =
              "Network error. Please check your connection";
          break;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );

    } catch (e) {

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong. Please try again.",
          ),
        ),
      );

    } finally {

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

    }
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
                  "Enter your email to receive a\n"
                  "secure password reset link.",
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
                      fontWeight:
                          FontWeight.w600,
                      color:
                          Colors.grey.shade800,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: emailController,
                  keyboardType:
                      TextInputType.emailAddress,
                  enabled: !isLoading,
                  decoration: InputDecoration(
                    hintText:
                        "e.g. alex@example.com",
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
                      borderSide:
                          const BorderSide(
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
                    onPressed:
                        isLoading ? null : sendResetLink,

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xff1554D1),
                      disabledBackgroundColor:
                          Colors.grey.shade400,
                      foregroundColor:
                          Colors.white,
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(18),
                      ),
                    ),

                    child: isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child:
                                CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
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
                  onTap: isLoading
                      ? null
                      : () {
                          Navigator.pop(context);
                        },
                  child: const Text(
                    "Back to Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                      color:
                          Color(0xff1554D1),
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