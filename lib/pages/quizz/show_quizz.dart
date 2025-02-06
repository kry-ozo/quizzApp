import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

class _ShowQuizzState extends State<ShowQuizz> {
  late Future<List<QuizzModel>> quizzQuestions;
  bool _isInitialized = false; 

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      final quizzProvider = Provider.of<QuizzProvider>(context);
      quizzQuestions = quizzProvider.fetchQuizzQuestions(
        widget.category,
        widget.difficulty,
        widget.amount,
      );
      _isInitialized = true; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder(
              future: quizzQuestions,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); 
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<String> answears = snapshot.data![0].incorrectAnswers;
                  answears.add(snapshot.data![0].correctAnswer);
                  return Text(snapshot.data![0].question); 
                } else {
                  return Text('No data available');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}