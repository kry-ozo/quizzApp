import 'package:flutter/material.dart';

class QuizzSettings extends StatelessWidget {
  final String quizzType;
  const QuizzSettings({super.key, required this.quizzType});
  static List<String >diffList = ["easy", "medium", "hard"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 250, 255),)) ,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 120,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 0, 53, 84))
                      )
                    ),
                  )
                  ),
                SizedBox(
                  width: 120,
                  child:DropdownButtonFormField(
                    value: diffList.first,
                    onChanged: (value){

                    },
                    items: diffList.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(value),
                        )
                        );
                    }).toList(),
                  )
                  ),
                
              ],
            ),
          ),
          const SizedBox(height: 40,),
          TextButton(onPressed: (){

          },
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 53, 84),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
          ),
          child: const Text("Start a quiz", style: TextStyle(color: Color.fromARGB(255, 255, 250, 255), fontSize:16),))
          
        ],
      ),
    );
  }
}