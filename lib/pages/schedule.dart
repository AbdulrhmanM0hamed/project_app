import 'package:flutter/material.dart';
import 'package:medical_app/Common%20Widgets/button_style.dart';
import 'package:medical_app/Common/Color_extentions.dart';
import 'package:medical_app/style/app_style.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String? _selectedTimeSlot;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _additionalNotesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'), // تحديد صورة الخلفية
          fit: BoxFit.cover, // تغطية الشاشة بالصورة
        )),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Schedule",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Select Appointment Date',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Calendar Widget or Date Picker can be placed here to select date

                Text(
                  'Available Time Slots',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                // List of available time slots
                _buildTimeSlot('09:00 AM - 10:00 AM'),
                _buildTimeSlot('10:00 AM - 11:00 AM'),
                _buildTimeSlot('11:00 AM - 12:00 PM'),
                _buildTimeSlot('01:00 PM - 02:00 PM'),
                _buildTimeSlot('02:00 PM - 03:00 PM'),
                _buildTimeSlot('03:00 PM - 04:00 PM'),
                // Add more time slots as needed

                SizedBox(height: 30),

                if (_selectedTimeSlot != null) ...[
                  Text(
                    'Booking Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // TextFields for user input
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _additionalNotesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Additional Notes',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                ],

                Button_Style(
                  title: "Book Appointment",
                  onpressed: () {
                    _bookAppointment(context);
                  },
                ),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String timeSlot) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTimeSlot = timeSlot;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: _selectedTimeSlot == timeSlot ? TColor.primary : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              timeSlot,
              style: TextStyle(
                fontSize: 16,
                color:
                    _selectedTimeSlot == timeSlot ? Colors.white : Colors.black,
              ),
            ),
            // Add any additional information or actions related to the time slot here
          ],
        ),
      ),
    );
  }

  void _bookAppointment(BuildContext context) {
    // Check if a time slot is selected
    if (_selectedTimeSlot != null) {
      // Retrieve the values from the text fields
      String name = _nameController.text.trim();
      String phoneNumber = _phoneNumberController.text.trim();
      String additionalNotes = _additionalNotesController.text;

      // Check if name and phone number are not empty
      if (name.isNotEmpty && phoneNumber.isNotEmpty) {
        // Perform the booking appointment action
        // For demonstration purposes, let's show a dialog with the entered information
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Appointment Details'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Time Slot: $_selectedTimeSlot'),
                  Text('Name: $name'),
                  Text('Phone Number: $phoneNumber'),
                  Text('Additional Notes: $additionalNotes'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );

        // Clear the text fields after booking appointment
        _nameController.clear();
        _phoneNumberController.clear();
        _additionalNotesController.clear();

        // Clear the selected time slot
        setState(() {
          _selectedTimeSlot = null;
        });
      } else {
        // Show a message if name or phone number is empty
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter your name and phone number.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      // Show a message if no time slot is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a time slot first.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
