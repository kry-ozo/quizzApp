import 'package:flutter/material.dart';
import 'package:quizz_app/components/question.dart';
import 'package:quizz_app/models/quizz_model.dart';


class ShowQuizz extends StatelessWidget {
  List<QuizzModel> questions;

  ShowQuizz({
    super.key, required this.questions,
    
  });

  @override
  Widget build(BuildContext context) {
    print(questions);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),

       body:  ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context,index){
          return Question(question: questions[index].question, answears: questions[index].allAnswears);
       })
    );
  }
}