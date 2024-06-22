import 'package:flutter/material.dart';
import 'package:pr1/screans%20of%20sign/signup.dart';

import '../signup_eng/login_eng.dart';

class start_page extends StatefulWidget {
  const start_page({super.key});

  @override
  State<start_page> createState() => _start_pageState();
}

class _start_pageState extends State<start_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF181A4D),
      body: Column(
        children: [
          Expanded(
            child: Container(
              //height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF181A4D),
                  image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.scaleDown)),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 5, 2, 2),
              width: double.infinity,
              //height: double.infinity,
              decoration:  BoxDecoration(
                border: Border.all(
                  color: const Color(0xffc58a00),
                  // border: 3px solid rgba(210, 171, 69, 1)// Change border color here
                  width: 2, // Set border width
                ),

                color: Color(0xFFFFFFFF),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome to our community",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 30, 45, 2),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogInEngineer()));
                            });
                          },
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35)),
                          textColor: Colors.white,
                          minWidth: double.infinity,
                          height: 55,
                          color: Color(0xFF181A4D),
                          elevation: 0.5,
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 2.5, 45, 10),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signAll()));
                            });
                          },
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          textColor:Color(0xFF181A4D),
                          minWidth: double.infinity,
                          height: 55,
                          elevation: 0.5,
                          child: const Text("Sign UP",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal)),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
