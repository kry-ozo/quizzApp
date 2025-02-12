import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  const CustomTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 115, 166, 173),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: 300,
      height: 200,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 28, color: const Color.fromARGB(255, 255, 250, 255), fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}