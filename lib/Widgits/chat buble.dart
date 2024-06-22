import 'package:flutter/material.dart';

class chatbubble extends StatelessWidget {
  const chatbubble({
    super.key,
    required this.mssage
  });
  final mssage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(15),
        child: Text(mssage,
            style: TextStyle(fontSize: 15, color: Colors.white)),
        decoration: BoxDecoration(
            color: Colors.indigo[700],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(16))),
      ),
    );
  }
}
