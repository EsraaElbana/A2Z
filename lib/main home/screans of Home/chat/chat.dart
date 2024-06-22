import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pr1/Widgits/appbar%20in%20chat.dart';
import 'dart:math' as math;

import '../../../Widgits/chat buble.dart';


class chat1 extends StatefulWidget {
  final String currentUser;
  final String otherUser;

  chat1({required this.currentUser, required this.otherUser});
  @override
  State<chat1> createState() => _chat1State();
}

class _chat1State extends State<chat1> {

  final _controler = ScrollController();

  List<String> messages = [];

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
         automaticallyImplyLeading: false,
          flexibleSpace: appbar(),
          elevation: 0,
          backgroundColor: Colors.white,

        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _controler,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return chatbubble(
                    mssage: messages[index],
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 16, right: 3, left: 3, bottom: 16),
              child: Row(
                children: [
                  Transform.rotate(
                      angle: 120 * math.pi / 180,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.attachment_rounded, size: 25),
                      )),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      // onSubmitted: (data) {
                      //   messages.add({
                      //     'messege': data,
                      //   });
                      //   _messageController.clear();
                      // },
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(239, 245, 245, 1.0),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.shade900),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _sendMessage();
                            },
                            icon: Icon(Icons.send),
                            color: Colors.indigo.shade900),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.indigo.shade900)),
                        hintText: 'Type a message...',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic_none_outlined,
                        size: 28,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    final message = _messageController.text;

    // TODO: Replace with your API endpoint
    final apiUrl = 'https://your-api-endpoint.com/send-message'; //غير صحيح Api

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'message': message},
        // TODO: Include authentication token in headers
        headers: {'Authorization': 'Bearer yourAuthToken'},
      );

      if (response.statusCode == 200) {
        // Message sent successfully, update UI or perform other actions
        setState(() {
          messages.add(message);
          _messageController.clear();
          _controler.animateTo(
            _controler.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          );
        });
      } else {
        // Handle errors
        print('Failed to send message. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      print('Error sending message: $e');
    }
  }
}
