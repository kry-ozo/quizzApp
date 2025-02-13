import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/components/question.dart';
import 'package:quizz_app/models/quizz_model.dart';
import 'package:quizz_app/providers/quizz_provider.dart';


// ignore: must_be_immutable
class ShowQuizz extends StatelessWidget {
  List<QuizzModel> questions;
  List<String> correctAnswers = [];
  
  
  ShowQuizz({
    super.key, required this.questions,
    
  });

  @override
  Widget build(BuildContext context) {

    questions.forEach((element) => correctAnswers.add(element.correctAnswer),);
    void _onTap(String answear, String id){
      Provider.of<QuizzProvider>(context, listen: false).setSelectedAnswer(id, answear);
    }

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
                return Question(quizz: questions[index], onTap: _onTap,);
             }),
           ),
           TextButton(onPressed: (){
              print(Provider.of<QuizzProvider>(context, listen: false).selectedAnswears);
           }, child: const Text("Done"))
         ],
       )
    );
  }
}