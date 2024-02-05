import 'package:flutter/material.dart';
import 'package:medical_app/Common%20Widgets/TextField.dart';
import 'package:medical_app/Common%20Widgets/button_style.dart';
import 'package:medical_app/Common/Color_extentions.dart';
import 'package:medical_app/Login/registe_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset("assets/images/logo.jpeg"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: TColor.primaryText,
                          fontFamily: "Quicksand-Regular"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextFieldWidget(
                      Labeltext: "E-mail",
                      ispass: false,
                    ),
                    SizedBox(height: 2),
                    TextFieldWidget(
                      Labeltext: "Password",
                      ispass: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Button_Style(
                        title: "Sign in",
                        onpressed: () {},
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget Password ? ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                    SizedBox(height: 40),
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
                          SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                              );
                            },
                            child: Text(
                              "Sign Up ",
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
      ),
    );
  }
}
