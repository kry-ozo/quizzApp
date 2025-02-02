import 'package:flutter/material.dart';
import 'package:quizz_app/components/custom_tile.dart';
import 'package:quizz_app/placeholders/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 46, left: 12, right: 12),
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
              return CustomTile(title: categories[index],);
          })
        )
      ],
    );
  }
}