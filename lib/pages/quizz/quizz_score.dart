import 'package:flutter/material.dart';
import 'package:quizz_app/pages/home_page.dart';

class QuizzScore extends StatelessWidget {
  final int score;
  final int amountOfQuestions;
  const QuizzScore({super.key, required this.score, required this.amountOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Score: $score/$amountOfQuestions"),
          ),
          Center(
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
            }, child: Text("Accept"))
          )
        ],
      ),
    );
  }
}