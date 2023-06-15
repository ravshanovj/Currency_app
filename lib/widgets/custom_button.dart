import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Color color;
  String text;
  Color textColor;
  CustomButton(
      {super.key,
      required this.color,
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
