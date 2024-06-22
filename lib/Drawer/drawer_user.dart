import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr1/client/catogry_%20Furniture/living_furnture.dart';

class drawerClient extends StatelessWidget {
  const drawerClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Define your end drawer content here
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 24,
                          color: const Color(0xFF191C55),
                        )),
                  ],
                ),
                Column(
                  children: [
                    ExpansionTile(
                      backgroundColor: Colors.white70,
                      collapsedTextColor: const Color(0xFF191C55),
                      textColor: const Color(0xFFC58A00),
                      iconColor: const Color(0xFFC58A00),
                      collapsedIconColor: const Color(0xFF191C55),
                      title: const Text("Home Furniture"),

                      childrenPadding: EdgeInsets.only(left: 40),
                      //children padding
                      children: [
                        ListTile(
                          title: const Text("Beds"),
                          onTap: () {
                            //action on press
                          },
                        ),

                        ListTile(
                          title: Text("Mattresses"),
                          onTap: () {
                            //action on press
                          },
                        ),
                        ListTile(
                          title: Text("Wardrobes"),
                          onTap: () {
                            //action on press
                          },
                        ),

                        //more child menu
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: Colors.white70,
                      collapsedTextColor: const Color(0xFF191C55),
                      textColor: const Color(0xFFC58A00),
                      iconColor: const Color(0xFFC58A00),
                      collapsedIconColor: const Color(0xFF191C55),
                      title: Text("Living Room"),
                      childrenPadding: EdgeInsets.only(left: 40),
                      //children padding
                      children: [
                        ListTile(
                          title: Text("Living Room Furniture"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => living()));
                          },
                        ),

                        //more child menu
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: Colors.white70,
                      collapsedTextColor: const Color(0xFF191C55),
                      textColor: const Color(0xFFC58A00),
                      iconColor: const Color(0xFFC58A00),
                      collapsedIconColor: const Color(0xFF191C55),
                      title: Text("Office Furniture"),
                      childrenPadding: EdgeInsets.only(left: 40),
                      //children padding
                      children: [
                        ListTile(
                          title: Text("Office Furniture"),
                          onTap: () {
                            //action on press
                          },
                        ),

                        //more child menu
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: Colors.white70,
                      collapsedTextColor: const Color(0xFF191C55),
                      textColor: const Color(0xFFC58A00),
                      iconColor: const Color(0xFFC58A00),
                      collapsedIconColor: const Color(0xFF191C55),
                      title: Text("About Us"),
                      childrenPadding: EdgeInsets.only(left: 40),
                      //children padding
                      children: [
                        ListTile(
                          title: Text("Office Furniture"),
                          onTap: () {
                            //action on press
                          },
                        ),

                        //more child menu
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: Colors.white70,
                      collapsedTextColor: const Color(0xFF191C55),
                      textColor: const Color(0xFFC58A00),
                      iconColor: const Color(0xFFC58A00),
                      collapsedIconColor: const Color(0xFF191C55),
                      title: Text("Contact Us"),
                      childrenPadding: EdgeInsets.only(left: 40),
                      //children padding
                      children: [
                        ListTile(
                          title: Text(""),
                          onTap: () {
                            //action on press
                          },
                        ),

                        //more child menu
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: Colors.white70,
                      collapsedTextColor: const Color(0xFF191C55),
                      textColor: const Color(0xFFC58A00),
                      iconColor: const Color(0xFFC58A00),
                      collapsedIconColor: const Color(0xFF191C55),
                      title: Text("Setting"),
                      childrenPadding: EdgeInsets.only(left: 40),
                      //children padding
                      children: [
                        ListTile(
                          leading: Icon(Icons.person_outline_sharp),
                          title: Text("My Account"),
                          onTap: () {
                            //action on press
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.translate),
                          title: Text("Language"),
                          onTap: () {
                            //action on press
                          },
                        ),
                        ListTile(

                          title: Text("Currency"),
                          leading: Icon(Icons.currency_exchange),
                          onTap: () {
                            //action on press
                          },
                        ),

                        //more child menu
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
