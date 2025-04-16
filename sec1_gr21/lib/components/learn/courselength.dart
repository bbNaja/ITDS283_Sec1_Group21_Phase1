import 'package:flutter/material.dart';

class Courselength extends StatelessWidget {
  const Courselength({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [Color(0xFF5564d8), Color(0xFF6279dc)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.timer,
                size: 20,
                color: Color(0xFFfafafe),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "68 min",
                style: TextStyle(fontSize: 14, color: Color(0xFFfafafe)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
