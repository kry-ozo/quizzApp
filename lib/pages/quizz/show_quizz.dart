import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/components/question.dart';
import 'package:quizz_app/models/quizz_model.dart';
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
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
       body:  Container() //TODO: Optimize this widget to not flicering next time
    );
  }
  
  
  
  
}