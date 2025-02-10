import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_app/models/quizz_model.dart';

class QuizzProvider extends ChangeNotifier{
    

  Future<List<QuizzModel>> fetchQuizzList() async {
    final response = await http.get(Uri.parse("https://opentdb.com/api.php?amount=10&category=23&difficulty=easy&type=multiple&encode=base64"));

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
}