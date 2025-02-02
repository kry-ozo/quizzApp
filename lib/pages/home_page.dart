import 'package:flutter/material.dart';
import 'package:quizz_app/components/custom_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 46, horizontal: 12),
          child: Text("Welcome back!", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
        ),
        Container(
          height: 200,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              CustomTile(title: "test1",),
              CustomTile(title: "test1",),
              CustomTile(title: "test1",)
            ],
          ),
        )
      ],
    );
  }
}