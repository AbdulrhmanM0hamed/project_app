import 'package:flutter/material.dart';
import 'package:medical_app/pages/Message.dart';
import 'package:medical_app/pages/schedule.dart';
import 'package:medical_app/pages/searchAi_page.dart';
import 'package:medical_app/pages/setting_page.dart';
import 'package:medical_app/style/app_style.dart';
import '../pages/home_page.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:motion_tab_bar_v2/motion-tab-item.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBody() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: _motionTabBarController,
      children: <Widget>[
        ChatScreen(),
        const HomePage(),
        SchedulePage(),
        SettingsPage(),
      ],
    );
  }

  Widget buildBottomNavigationBar() {
    return MotionTabBar(
      controller: _motionTabBarController,
      initialSelectedTab: "Home",
      labels: const [
        "Messages",
        "Home",
        "Schedule",
        "Settings",
      ],
      icons: const [
        Icons.message,
        Icons.home,
        Icons.schedule,
        Icons.settings,
      ],
      badges: [
        const MotionBadgeWidget(
            text: '1', textColor: Colors.white, color: Colors.red, size: 18),
        Container(
          color: Colors.black,
          padding: const EdgeInsets.all(2),
          child: const Text('1',
              style: TextStyle(fontSize: 14, color: Colors.white)),
        ),
        null,
        const MotionBadgeWidget(
            isIndicator: true, color: Colors.red, size: 5, show: true),
      ],
      tabSize: 50,
      tabBarHeight: 55,
      textStyle: const TextStyle(
          fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),
      tabIconColor: Colors.blue[600],
      tabIconSize: 30.0,
      tabIconSelectedSize: 26.0,
      tabSelectedColor: Colors.blue[600],
      tabIconSelectedColor: Colors.white,
      tabBarColor: Color.fromARGB(255, 248, 249, 250),
      onTabItemSelected: (int value) {
        setState(() {
          _motionTabBarController!.index = value;
        });
      },
    );
  }
}
