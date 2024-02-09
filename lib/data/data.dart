import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/Services/doctor_content.dart';
import 'package:medical_app/Services/pharmacy.dart';

class Services {
  final String image;
  final Color color;
  final String title;
  final WidgetBuilder content;
  Services({
    required this.image,
    required this.color,
    required this.title,
    required this.content,
  });
}

// Services List OF DATA

List<Services> servicesList = [
  Services(
    image: 'assets/icons/doctor-Icon.svg',
    color: const Color(0xffDCEDF9),
    title: "Doctor",
    content: (BuildContext context) => DoctorContent(),
  ),
  Services(
    image: 'assets/icons/noun-pill.svg',
    color: const Color(0xffFAF0DB),
    title: "Pharmacies",
    content: (BuildContext context) => MapScreen(),
  ),
  Services(
    image: 'assets/icons/noun-medical-test.svg',
    color: const Color(0xffD6F6FF),
    title: "ٌReport",
    content: (BuildContext context) => DoctorContent(),
  ),
  Services(
    image: 'assets/icons/noun-corona.svg',
    color: const Color(0xffF2E3E9),
    title: "ٌone more",
    content: (BuildContext context) => DoctorContent(),
  ),
];

/// Upcoming Appointments

class Appointments {
  final String date;
  final String time;
  final String title;
  final String subTitle;
  final Color color;

  Appointments({
    required this.color,
    required this.date,
    required this.time,
    required this.title,
    required this.subTitle,
  });
}

// Upcoming Appointments List OF DATA

List<Appointments> upcomingAppointmentsList = [
  Appointments(
    date: "12\nTue",
    time: DateFormat('hh:mm a').format(DateTime.now()),
    title: "Dr. Mim Akhter",
    subTitle: "Depression",
    color: const Color(0xff1C6BA4),
  ),
];
