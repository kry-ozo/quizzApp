import 'package:flutter/material.dart';

class QuizzSettings extends StatelessWidget {
  final String quizzType;
  const QuizzSettings({super.key, required this.quizzType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$quizzType Quizz", style: TextStyle(color: Color.fromARGB(255, 255, 250, 255), fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 53, 84),
      ),
      body: Column(
        children: [
          Text("Quizz Settings")
        ],
      ),
    );
  }
}