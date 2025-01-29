import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class QuizzProvider extends ChangeNotifier{
  Future<http.Response> _getApiKey(){
    return http.get(Uri.parse('https://opentdb.com/api_token.php?command=request'));
  }
}