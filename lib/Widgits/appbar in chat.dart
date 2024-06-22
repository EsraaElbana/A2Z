import 'package:flutter/material.dart';

Widget appbar() {
  return row_in_appbarchat();
}

class row_in_appbarchat extends StatelessWidget {
  const row_in_appbarchat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
        ),
        CircleAvatar(
          radius: 50,
          child: Image.asset("assets/Ellipse 2.png"),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("user 1"),
          SizedBox(
            height: 8,
          ),
          Text("last seen")
        ])
      ],
    );
  }
}
