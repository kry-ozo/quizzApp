import 'dart:convert';

class QuizzModel {
  final String type;
  final String difficulty;
  final String category;
  final String question;
  final String correctAnswer;
  List<String> allAnswears;

  QuizzModel({required this.type, required this.difficulty, required this.category, required this.question, required this.correctAnswer, required this.allAnswears});

  factory QuizzModel.fromJson(Map<String, dynamic> json){
    List<int> questionBytes = base64.decode(json['question']);
    String finalQuestion = utf8.decode(questionBytes);

    List<int> correctAnswerBytes = base64.decode(json['correct_answer']);
    String finalCorrectAnswearQuestion = utf8.decode(correctAnswerBytes);
    
    List<String> allAnswears = List<String>.from(json['incorrect_answers']).map((answear){
      List<int> answerBytes = base64.decode(answear);
      String finalAnswearQuestion = utf8.decode(answerBytes);
      return finalAnswearQuestion;
    }).toList();

    allAnswears.add(finalCorrectAnswearQuestion);
    allAnswears.shuffle();


    return QuizzModel(
      type: json['type'],
      difficulty: json['difficulty'],
      category: json['category'],
      question: finalQuestion,
      correctAnswer: finalCorrectAnswearQuestion ,
      allAnswears: allAnswears
    );
  }
}

