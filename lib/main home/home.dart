import 'package:flutter/material.dart';
import 'package:pr1/main%20home/screans%20of%20Home/chat/chatpage.dart';
import 'package:pr1/main%20home/screans%20of%20Home/home_comunity.dart';
import 'package:pr1/main%20home/screans%20of%20Home/posts/new%20post.dart';
import 'package:pr1/main%20home/screans%20of%20Home/profile.dart';
import 'package:pr1/main%20home/screans%20of%20Home/requests/request_page.dart';
import 'package:pr1/main%20home/screans%20of%20Home/search.dart';
import '../Drawer/drawer_Engineer.dart';


class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const drawerEngineer(),
                ));
          },
          icon: Icon(Icons.menu, size: 30, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.chevron_right_sharp,
                  size: 35, color: Colors.black)),
        ],
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 20,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Request(),
                        ));
                  },
                  tileColor: Colors.white,
                  title: const Text("Requests", style: TextStyle(fontSize: 20)),
                  leading: Icon(Icons.mark_as_unread_sharp,
                      color: Colors.indigo.shade900, size: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 20,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => chatpage(),
                        ));
                  },
                  tileColor: Colors.white,
                  title: const Text("Chat", style: TextStyle(fontSize: 20)),
                  leading: Icon(Icons.mark_unread_chat_alt_outlined,
                      color: Colors.indigo.shade900, size: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 20,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ));
                  },
                  tileColor: Colors.white,
                  title: const Text("Profile", style: TextStyle(fontSize: 20)),
                  leading: Icon(Icons.person,
                      color: Colors.indigo.shade900, size: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 20,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityPage(),
                        ));
                  },
                  tileColor: Colors.white,
                  title: Text("Community", style: TextStyle(fontSize: 20)),
                  leading: Icon(Icons.groups_rounded,
                      color: Colors.indigo.shade900, size: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 20,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewPost(),
                        ));
                  },
                  tileColor: Colors.white,
                  title: const Text("Post", style: TextStyle(fontSize: 20)),
                  leading:
                      Icon(Icons.add, color: Colors.indigo.shade900, size: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 20,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(),
                        ));
                  },
                  tileColor: Colors.white,
                  title: Text("Search", style: TextStyle(fontSize: 20)),
                  leading: Icon(Icons.search_sharp,
                      color: Colors.indigo.shade900, size: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
