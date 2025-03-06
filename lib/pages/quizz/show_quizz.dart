import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/components/question.dart';
import 'package:quizz_app/models/quizz_model.dart';
import 'package:quizz_app/pages/quizz/quizz_score.dart';
import 'package:quizz_app/providers/quizz_provider.dart';


// ignore: must_be_immutable
class ShowQuizz extends StatelessWidget {
  List<QuizzModel> questions;
  
  
  
  ShowQuizz({
    super.key, required this.questions,
    
  });

  @override
  Widget build(BuildContext context) {
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
           TextButton(
            onPressed: (){
              Provider.of<QuizzProvider>(context, listen: false).setCorrectAnswer(questions);
              int score = Provider.of<QuizzProvider>(context, listen: false).calculateScore();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> QuizzScore(score: score, amountOfQuestions: questions.length)));
           }, child: const Text("Done", style: TextStyle(
            color: Color.fromARGB(255, 0, 53, 84),
            fontSize: 24
           ),))
         ],
       )
    );
  }
}