import 'package:flutter/material.dart';
import 'package:medical_app/Common%20Widgets/button_style.dart';
import 'package:medical_app/Common/Color_extentions.dart';
import 'package:medical_app/Login/login_screen.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController? controller = PageController();
  int selectPage = 0;

  List pageArr = [
    {
      "title": "Have a good health",
      "subtitle": "Best Doctor Appointment Mobile App",
      "image": "assets/images/1.PNG",
    },
    {
      "title": "Be stronger",
      "subtitle": "Get E.Prescripton From a Doctor",
      "image": "assets/images/2.PNG",
    },
    {
      "title": "Have nice body",
      "subtitle": "Best Medicine Reminder",
      "image": "assets/images/3.PNG",
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller?.addListener(() {
      selectPage = controller?.page?.round() ?? 0;

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Color(0xFFE2DFDF),
      body: Stack(children: [
        SafeArea(
          child: PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return Column(
                  children: [
                    Image.asset(
                      pObj["image"].toString(),
                      width: media.width * 0.8,
                      height: media.width * 0.8,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      pObj["subtitle"].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              }),
        ),
        SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageArr.map((pObj) {
                  var index = pageArr.indexOf(pObj);
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: selectPage == index
                            ? TColor.primary
                            : TColor.primary.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(6)),
                  );
                }).toList(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Button_Style(
                  title: "Start",
                  onpressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  },
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
