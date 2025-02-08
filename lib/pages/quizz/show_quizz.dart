import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/components/question.dart';
import 'package:quizz_app/providers/quizz_provider.dart';

class ShowQuizz extends StatefulWidget {
  final String difficulty;
  final String category;
  final String amount;

  const ShowQuizz({
    super.key,
    required this.difficulty,
    required this.category,
    required this.amount,
  });

  @override
  State<ShowQuizz> createState() => _ShowQuizzState();
}

class _ShowQuizzState extends State<ShowQuizz>{
  @override
  Widget build(BuildContext context) {
    final quizzProvider = Provider.of<QuizzProvider>(context, listen: false);

    if (quizzProvider.questions.isEmpty && !quizzProvider.isLoading) {
      quizzProvider.fetchQuizzQuestions(widget.category, widget.difficulty, widget.amount);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
       body: Consumer<QuizzProvider>(
        builder: (context, quizzProvider, child) {
          if (quizzProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (quizzProvider.error != null) {
            return Center(child: Text('Error: ${quizzProvider.error}'));
          } else if (quizzProvider.questions.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: quizzProvider.questions.length,
              itemBuilder: (context, index) {
               
                return Question(
                  question: quizzProvider.questions[index].question,
                  answears: quizzProvider.questions[index].allAnswears,
                );
              },
            );
          }
        }
      ),
    );
  }
  
  
}