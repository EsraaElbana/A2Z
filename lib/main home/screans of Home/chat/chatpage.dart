import 'package:flutter/material.dart';


import 'chat.dart';

class chatpage extends StatefulWidget {
  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  String searchQuery = '';
  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hey there!',
      'isMe': false,
      'userImage': 'assets/user1.png',
      'username': 'User 1',
    },
    {
      'text': 'How are you?',
      'isMe': true,
      'userImage': 'assets/user2.png',
      'username': 'User 2',
    },
    // Add more messages as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "Chat",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only( bottom: 10,left: 10, right: 10),
              child: TextField(
                onChanged: (value) {
                  searchQuery = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                      width: 0,
                    ),
                  ),
                  hintText: 'Search ....',
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.grey),
                    onPressed: () async {
                      // Implement search functionality
                      //    List<String> searchResults = await searchUsers(searchQuery);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => chat1(
                                currentUser: 'YourUserName',
                                otherUser: 'RecipientUserName',
                              ),
                            ));
                      },
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(messages[index]['userImage']),
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  messages[index]['username'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: messages[index]['isMe']
                                        ? Colors.grey
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    messages[index]['text'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
