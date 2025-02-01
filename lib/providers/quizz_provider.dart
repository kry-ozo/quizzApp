import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_app/models/quizz_model.dart';

class QuizzProvider extends ChangeNotifier{
  
  Future<QuizzModel>fetchQuizzQuestion(String category, String diff) async {
    final response = await http.get(Uri.parse("https://opentdb.com/api.php?amount=1&category=$category&difficulty=$diff"));
    if(response.statusCode == 0){
      return QuizzModel.fromJson(jsonDecode(response.body) as Map <String, dynamic>);
    }else{
      throw Exception("Failed to load question");
    }
  } 

  
}