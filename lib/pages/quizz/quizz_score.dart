import 'package:flutter/material.dart';

class QuizzScore extends StatelessWidget {
  final int score;
  final int amountOfQuestions;
  const QuizzScore({super.key, required this.score, required this.amountOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Score: $score/$amountOfQuestions"),
      ),
    );
  }
}