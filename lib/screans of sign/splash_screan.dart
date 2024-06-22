import 'package:flutter/material.dart';
import 'package:pr1/screans%20of%20sign/start%20page.dart';


class splash_screan extends StatefulWidget {
  const splash_screan({Key? key}) : super(key: key);

  @override
  State<splash_screan> createState() => _splash_screanState();
}

class _splash_screanState extends State<splash_screan> {
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => start_page()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF0E1236),
      // color:  Color(0xFF0C134D),
      body: Container(
        child: Center(
            child: Image.asset(
          "assets/logo.png",
          height: double.infinity,
          width: double.infinity,
        )),
      ),
    );
  }
}
