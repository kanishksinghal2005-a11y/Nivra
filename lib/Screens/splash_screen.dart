import 'package:flutter/material.dart';
import 'package:nivra/Screens/Onboarding/onboarding_screen.dart';
//import 'package:google_fonts/google_fonts.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();

    Future.delayed(Duration(seconds: 3),(){
      if(!mounted) return;
 //Navigate to onboard screen
 Navigator.pushReplacement(context, 
 MaterialPageRoute(builder: (context)=> const OnboardingScreen())
 );
    //navigate to dashboard
    //navigate to login / log out
    });
   
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold( 

      backgroundColor: Colors.white,
      body:SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(tag: "Logo", child: Image.asset("Assets/logo.png",width: 120,)),
              SizedBox(height: 20,),
              Text("Nivra",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36),),
             Text("The Smarter Way Forward",style: TextStyle(fontSize: 18,color: Colors.blueGrey),)


            ],
          ),
        )),
    );
  }
}