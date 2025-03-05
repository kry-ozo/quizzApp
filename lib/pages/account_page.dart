import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(height: 50,),
        SizedBox(
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Text("Username", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 53, 84)),),
              )
            ],
          ),
        ),
        SizedBox(height: 30,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromARGB(255, 255, 250, 255),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 0, 53, 84),
                blurRadius: 7,
                spreadRadius: 2
              )
            ]
          ),
          child: SizedBox(
            height: 80,
            child: Icon(Icons.person, size: 70,color:Color.fromARGB(255, 0, 53, 84) ,),
          ),
        ),
        SizedBox(height: 50,),
        SizedBox(child: Text("Your last Quiz Scores", style: TextStyle(color:Color.fromARGB(255, 0, 53, 84), fontSize: 24),),),
      ],
    );
  }
}