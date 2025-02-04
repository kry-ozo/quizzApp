import 'package:flutter/material.dart';

class QuizzSettings extends StatelessWidget {
  final String quizzType;
  const QuizzSettings({super.key, required this.quizzType});
  static List<String >diffList = ["easy", "medium", "hard"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$quizzType Quizz", style: TextStyle(color: Color.fromARGB(255, 255, 250, 255), fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 53, 84),
      ),
      body:   Column(
        children: [
           Center(
            child:  Padding(
            padding: EdgeInsets.only(top: 70),
            child: Text("Quizz Settings", style: TextStyle(color: Color.fromARGB(255, 0, 53, 84), fontSize: 32, fontWeight: FontWeight.bold,) ,),
                    ),
          ),
          SizedBox(height: 40,),
          SizedBox(
            child: Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 120,
                  child: TextField(
                    decoration: InputDecoration(
                      
                    ),
                  )
                  ),
                SizedBox(
                  width: 120,
                  child:DropdownButton(
                    value: diffList.first,
                    onChanged: (value){

                    },
                    items: diffList.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                        );
                    }).toList(),
                  )
                  ),
                
              ],
            ),
          ),
          TextButton(onPressed: (){

          }, child: Text("Start a quiz"))
          
        ],
      ),
    );
  }
}