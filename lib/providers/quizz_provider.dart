import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_app/models/quizz_model.dart';

class QuizzProvider extends ChangeNotifier{

  final Map<String, String?> _selectedAnswers = {};
  final Map<String, String?> _correctAnswears = {};
  Map<String, String?> get selectedAnswears =>_selectedAnswers;
  Map<String, String?> get correctAnswears => _correctAnswears;

  

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

  void setCorrectAnswer(List<QuizzModel> questions) {
    for(int i = 0; i<=questions.length-1; i++ ){
      _correctAnswears[questions[i].id] = questions[i].correctAnswer;
    }
    notifyListeners(); 
  }

  int calculateScore() {
    print(_correctAnswears);
    print(_selectedAnswers);
    int score = 0;
    _selectedAnswers.forEach((questionId, userAnswear){
      if(userAnswear == _correctAnswears[questionId]){
        score++;
      }
    });
    _clear();
    return score;
  }

  void _clear(){
    _selectedAnswers.clear();
    _correctAnswears.clear();
  }
}