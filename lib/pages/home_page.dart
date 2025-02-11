import 'package:flutter/material.dart';
import 'package:quizz_app/components/custom_tile.dart';
import 'package:quizz_app/pages/quizz/quizz_settings.dart';
import 'package:quizz_app/placeholders/categories.dart';
import 'package:quizz_app/placeholders/users_placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 100, left: 12, right: 12),
          child: Text("Welcome back!", style: TextStyle(color: Color.fromARGB(255, 0, 53, 84), fontSize: 32, fontWeight: FontWeight.bold),),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Text("Popular categories", style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index){
              return GestureDetector(
                child: CustomTile(title: categories[index].catageoryName,),
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> QuizzSettings(category: categories[index])));
                },
                );
          })
        ),
        const Padding(
          padding: EdgeInsets.only(top: 46, left: 12, right: 12),
          child: Text("Top 7 players", style: TextStyle(color: Color.fromARGB(255, 0, 53, 84), fontSize: 28, fontWeight: FontWeight.bold),),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(players[index].name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    Text("points: ${players[index].points}", style: const TextStyle(fontSize: 18))
                  ],
                ),
              );
          }),
        ),
      ],
    );
  }
}