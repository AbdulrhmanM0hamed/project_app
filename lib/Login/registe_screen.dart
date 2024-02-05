import 'package:flutter/material.dart';
import 'package:medical_app/Common%20Widgets/TextField.dart';
import 'package:medical_app/Common%20Widgets/button_style.dart';
import 'package:medical_app/Common/Color_extentions.dart';
import 'package:medical_app/Login/login_screen.dart';
import 'package:medical_app/components/bottom_bar.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 140,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Image.asset("assets/images/logo.jpeg"),
                  ),
                  Text(
                    'Sign UP',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: TColor.primaryText,
                        fontFamily: "Quicksand-Regular"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFieldWidget(
                    Labeltext: "Username",
                    ispass: false,
                  ),
                  TextFieldWidget(
                    Labeltext: "E-mail",
                    ispass: false,
                  ),
                  TextFieldWidget(
                    Labeltext: "Phone",
                    ispass: false,
                  ),
                  TextFieldWidget(
                    Labeltext: "Password",
                    ispass: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button_Style(
                      title: "Sign UP",
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => YourWidget()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Sign in with',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: TColor.primaryText,
                        fontFamily: "Quicksand"),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/images/logoApple.png', // استبدلها بمسار الصورة الخاصة باللوجو
                            height: 70, // ارتفاع الصورة
                            width: 70, // عرض الصورة
                          ),
                          onPressed: () {
                            // أداء العمليات عند الضغط على الزر
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/images/logoFace.png', // استبدلها بمسار الصورة الخاصة باللوجو
                            height: 50, // ارتفاع الصورة
                            width: 50, // عرض الصورة
                          ),
                          onPressed: () {
                            // أداء العمليات عند الضغط على الزر
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/images/logoGoogle.png', // استبدلها بمسار الصورة الخاصة باللوجو
                            height: 50, // ارتفاع الصورة
                            width: 50, // عرض الصورة
                          ),
                          onPressed: () {
                            // أداء العمليات عند الضغط على الزر
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            "Sign In ",
                            style: TextStyle(color: TColor.primary),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
