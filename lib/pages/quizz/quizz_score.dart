import 'package:flutter/material.dart';
import 'package:quizz_app/main.dart';


class QuizzScore extends StatelessWidget {
  final int score;
  final int amountOfQuestions;
  const QuizzScore({super.key, required this.score, required this.amountOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Your Score: $score/$amountOfQuestions", style: const TextStyle(fontSize: 40, color: const Color.fromARGB(255, 0, 53, 84), fontWeight: FontWeight.bold),),
          ),
          const  SizedBox(height: 100,),
          Center(
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainApp()));
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 53, 84),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20)
            ),
             child: const Text("Accept", style: TextStyle(color:Color.fromARGB(255, 255, 250, 255), fontSize: 24),))
          )
        ],
      ),
    );
  }
}