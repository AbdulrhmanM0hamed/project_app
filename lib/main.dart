import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Login/login_screen.dart';
import 'package:medical_app/Login/onbording.dart';
import 'package:medical_app/components/bottom_bar.dart';
import 'package:medical_app/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: /* AnimatedSplashScreen(
        splash: Center(
          child: Container(
            height: 150,
            width: 150,
            child: Image.asset(
                'assets/images/LogoAni.gif'), // استبدلها بمسار الصورة المتحركة الخاصة بشعار تطبيقك
          ),
        ),
        nextScreen:*/
          YourWidget(), // استبدلها بالشاشة الرئيسية الخاصة بتطبيقك
      //  splashTransition: SplashTransition.fadeTransition,
      //duration: 3000, // وقت عرض الشاشة المتحركة بالمللي ثانية
      //),
    );
  }
}
