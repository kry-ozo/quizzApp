import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/models/category_model.dart';
import 'package:quizz_app/models/quizz_model.dart';
import 'package:quizz_app/pages/quizz/show_quizz.dart';
import 'package:quizz_app/providers/quizz_provider.dart';

class QuizzSettings extends StatefulWidget {
  final CategoryModel category;
  const QuizzSettings({super.key, required this.category});
  static List<String >diffList = ["easy", "medium", "hard"];

  @override
  State<QuizzSettings> createState() => _QuizzSettingsState();
}

class _QuizzSettingsState extends State<QuizzSettings> {
  
  String? dropdownValue = QuizzSettings.diffList.first;
  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back, color: const Color.fromARGB(255, 255, 250, 255),)) ,
        title: Text("${widget.category.catageoryName} Quizz", style: const TextStyle(color: const Color.fromARGB(255, 255, 250, 255), fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 53, 84),
      ),
      body:   Column(
        children: [
           const Center(
            child:  const Padding(
            padding: const EdgeInsets.only(top: 70),
            child: const Text("Quizz Settings", style: const TextStyle(color: const Color.fromARGB(255, 0, 53, 84), fontSize: 32, fontWeight: FontWeight.bold,) ,),
                    ),
          ),
          const SizedBox(height: 40,),
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 SizedBox(
                  width: 120,
                  child: TextField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      border: const UnderlineInputBorder(
                        borderSide: const BorderSide(color: const Color.fromARGB(255, 0, 53, 84))
                      )
                    ),
                  )
                  ),
                SizedBox(
                  width: 200,
                  child:DropdownButtonFormField(
                    value: dropdownValue,
                    hint: const Text("Difficulty"),
                    onChanged: (value){
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                    items: QuizzSettings.diffList.map<DropdownMenuItem<String>>((String value){
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
          TextButton(onPressed: () async {
            String amount = _amountController.text;
            List<QuizzModel> questions = await Provider.of<QuizzProvider>(context, listen: false).fetchQuizzList(amount,widget.category.id, dropdownValue);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> ShowQuizz(questions: questions,))
              );
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