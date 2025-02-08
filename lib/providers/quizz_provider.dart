import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_app/models/quizz_model.dart';

class QuizzProvider extends ChangeNotifier{
    List<QuizzModel> _questions = [];
    bool _isLoading = false;
    String? _error;

    List<QuizzModel> get questions => _questions;
    bool get isLoading => _isLoading;
    String? get error => _error;

    Future<void> fetchQuizzQuestions(String category, String diff, String amount) async {
    _isLoading = true;
    notifyListeners();


    try{
      final response = await http.get(Uri.parse("https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$diff&type=multiple&encode=base64"));
    
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      _questions =  (jsonData['results'] as List).map(
        (item)=> QuizzModel.fromJson(item)
      ).toList();
    }else{
      throw Exception("Failed to load questions");
    }
    }catch(e){
      _error = e.toString();
    }finally{
      _isLoading = false;
      notifyListeners();
    }
    
  } 

  

  
}