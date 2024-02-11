import 'package:flutter/material.dart';
import 'package:medical_app/Common/Color_extentions.dart';

import '../Common/Color_extentions.dart';

class ChatMessage {
  final String text;
  final String sender;

  ChatMessage({required this.text, required this.sender});
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _addMessage(String text, String sender) {
    setState(() {
      _messages.insert(0, ChatMessage(text: text, sender: sender));
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[350],
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/profile.jpg'), // صورة المتصل
            ),
            SizedBox(width: 16.0),
            Text(
              'Doctor',
              style: TextStyle(color: Color.fromARGB(255, 79, 78, 78)),
            ), // اسم المتصل
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Align(
                    alignment: _messages[index].sender == 'Me'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: _messages[index].sender == 'Me'
                            ? Colors.blue
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        _messages[index].text,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.zero, // إزالة الحدود بعد التحديد
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Color.fromARGB(255, 0, 89, 255),
                  ),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      _addMessage(_textController.text, 'Me');
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
