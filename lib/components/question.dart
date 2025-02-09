

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  final List<String> answears;
  const Question({super.key, required this.question, required this.answears});

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
            child: Text(question, style: const TextStyle(color: const Color.fromARGB(255, 255, 250, 255), fontSize: 24), textAlign: TextAlign.center),
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
            children: answears.map((answear)=> Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: const Color.fromARGB(255, 115, 166, 173),
                
              ),
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(answear, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, color: const Color.fromARGB(255, 255, 250, 255)),)
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