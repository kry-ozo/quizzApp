import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_app/models/quizz_model.dart';

class QuizzProvider extends ChangeNotifier{

  Map<String, String?> _selectedAnswers = {};
  Map<String, String?> get selectedAnswears =>_selectedAnswers;

  

  Future<List<QuizzModel>> fetchQuizzList(String amount, String categoryId, String? diff) async {
    final response = await http.get(Uri.parse("https://opentdb.com/api.php?amount=$amount&category=$categoryId&difficulty=$diff&type=multiple&encode=base64"));

    try{
      if(response.statusCode == 200){
        var jsonData = jsonDecode(response.body);
        List<QuizzModel> questions = (jsonData['results'] as List).map(
          (item) => QuizzModel.fromJson(item)
        ).toList();
        return questions;
      }else{
        throw Exception("Failed to load questions");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

  void setSelectedAnswer(String questionIndex, String? answer) {
    _selectedAnswers[questionIndex] = answer;
    notifyListeners(); 
  }

  int calculateScore(List<QuizzModel> questions) {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (_selectedAnswers[i] == questions[i].correctAnswer) {
        score++;
      }
    }
    return score;
  }
}