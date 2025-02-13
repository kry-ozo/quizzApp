import 'package:flutter/material.dart';
import 'package:quizz_app/components/question.dart';
import 'package:quizz_app/models/quizz_model.dart';


// ignore: must_be_immutable
class ShowQuizz extends StatelessWidget {
  List<QuizzModel> questions;
  List<String> correctQuestions = [];
  ShowQuizz({
    super.key, required this.questions,
    
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),

       body:  Column(
         children: [
           Expanded(
             child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context,index){
                correctQuestions.add(questions[index].correctAnswer);
                return Question(question: questions[index].question, answears: questions[index].allAnswears);
             }),
           ),
           TextButton(onPressed: (){

           }, child: const Text("Done"))
         ],
       )
    );
  }
}