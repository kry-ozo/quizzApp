import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_app/models/quizz_model.dart';

class QuizzProvider extends ChangeNotifier{
  
  Future<List<QuizzModel>>fetchQuizzQuestions(String category, String diff, String amount) async {
    final response = await http.get(Uri.parse("https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$diff"));
    if(response.statusCode == 0){
      var jsonData = jsonDecode(response.body);
      return (jsonData['results'] as List).map(
        (item)=> QuizzModel.fromJson(item)
      ).toList();
    }else{
      throw Exception("Failed to load questions");
    }
  } 

  
}