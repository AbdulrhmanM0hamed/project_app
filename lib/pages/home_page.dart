import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/Login/registe_screen.dart';
import 'package:medical_app/Widgets/GetBestMedicalService.dart';
import 'package:medical_app/Widgets/Search_medical.dart';
import 'package:medical_app/Widgets/User_Info.dart';
import 'package:medical_app/Widgets/upcomingAppointment.dart';
import 'package:medical_app/pages/PortfolioScreen.dart';
import 'package:medical_app/style/app_style.dart';
import '../data/data.dart';
import '../size_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'), // تحديد صورة الخلفية
          fit: BoxFit.cover, // تغطية الشاشة بالصورة
        )),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 7,
              ),
              child: Column(
                children: const [
                  // User Info Area .
                  UserInfo(),
                  // SearchMedical Area.
                  SearchMedical(),
                  // Services Area .
                  Services(),
                  // GetBestMedicalService
                  GetBestMedicalService(),
                ],
              ),
            ),
            // Upcoming Appointments
            const UpcomingAppointments()
          ],
        ),
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Services",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w700, letterSpacing: 1),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: servicesList
              .map(
                (e) => CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => e.content(context)),
                      );
                    },
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal! * 17,
                      height: SizeConfig.blockSizeHorizontal! * 17,
                      decoration: BoxDecoration(
                        color: e.color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(e.image),
                            Text(
                              e.title,
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
