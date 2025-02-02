import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  const CustomTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      
      margin: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.blue,
      width: 240,
      child:  Column(
        children: [
          Text(title)
        ],
      ),
    );
  }
}