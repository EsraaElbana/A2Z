import 'package:flutter/material.dart';

import 'fetch user.dart';


class chat_user extends StatefulWidget {
  @override
  _chat_userState createState() => _chat_userState();
}

class _chat_userState extends State<chat_user> {
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hey there!', 'isMe': false, 'userImage': 'assets/user1.png'},
    {'text': 'How are you?', 'isMe': true, 'userImage': 'assets/user2.png'},
    // Add more messages as needed...
  ];

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {

        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black),
        ),
        title:Text("Chat",style: TextStyle(color: Colors.black),),
        centerTitle:true,
      ),
      body: Column(
        children: [
          Expanded(
            child:  ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: messages[index]['isMe']
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!messages[index]['isMe'])
                        CircleAvatar(
                          backgroundImage: AssetImage(messages[index]['userImage']),
                        ),
                      SizedBox(width: 8.0),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: messages[index]['isMe']
                              ? Colors.blue
                              : Colors.green,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          messages[index]['text'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      if (messages[index]['isMe'])
                        CircleAvatar(
                          backgroundImage: AssetImage(messages[index]['userImage']),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Implement sending message functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
