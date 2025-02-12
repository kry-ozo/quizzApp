import 'package:flutter/material.dart';
import 'package:quizz_app/components/custom_tile.dart';
import 'package:quizz_app/pages/quizz/quizz_settings.dart';
import 'package:quizz_app/placeholders/categories.dart';

class QuizzPage extends StatelessWidget {
  const QuizzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Padding(
          padding: const EdgeInsets.only(top: 70, bottom: 20),
          child: const Text("All Quizzes", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 53, 84)),),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: GestureDetector(
                child: CustomTile(title: categories[index].catageoryName,),
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> QuizzSettings(category: categories[index])));
                },
                ),
              );
          }),
        ),
      ],
    );
  }
}