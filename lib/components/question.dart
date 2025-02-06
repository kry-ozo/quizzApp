import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  final List<String> answears;
  const Question({super.key, required this.question, required this.answears});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Text(question),
          Row(
            children: answears.map((answear)=> TextButton(onPressed: (){

            }, child: Text(answear))).toList(),
          )
        ],
      ),
    );
  }
}