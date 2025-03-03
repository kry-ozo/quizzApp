

import 'package:flutter/material.dart';
import 'package:quizz_app/models/quizz_model.dart';

class Question extends StatefulWidget {
  final QuizzModel quizz;
  final void Function(String, String)? onTap;
  static String? selectedAnswear;
  const Question({super.key, required this.quizz, required this.onTap});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 255, 250, 255)
      ),
      height: 350,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            child: Text(widget.quizz.question, style: const TextStyle(color: const Color.fromARGB(255, 255, 250, 255), fontSize: 24), textAlign: TextAlign.center),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              color: const Color.fromARGB(255, 0, 53, 84),
              borderRadius: const BorderRadius.vertical(top: const Radius.circular(10)),
            ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.quizz.allAnswears.map((answear)=> Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Question.selectedAnswear == answear ?Color.fromARGB(255, 0, 86, 97) :  Color.fromARGB(255, 115, 166, 173) ,
                
              ),
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: GestureDetector(
                child: Text(answear, textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 255, 250, 255),
                  fontWeight: Question.selectedAnswear == answear ? FontWeight.bold :  FontWeight.normal
                  )
                ,),
                onTap: (){
                  setState(() {
                    Question.selectedAnswear = answear;
                  });
                  widget.onTap!(answear, widget.quizz.id);
                },
                )
            )).toList(),
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: const Color.fromARGB(255, 0, 53, 84),
              borderRadius: const BorderRadius.vertical(bottom: const Radius.circular(10))
            ),
          )
        ],
      ),
    );
  }
}