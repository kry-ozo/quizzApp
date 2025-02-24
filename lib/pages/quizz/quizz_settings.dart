import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  
  String? dropdownValue;
  TextEditingController _amountController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  Color _borderColor = Colors.grey;
  bool _isTouched = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange); 
    _focusNode.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _borderColor = _focusNode.hasFocus ? Color.fromARGB(255, 0, 53, 84) : Colors.grey;
    });
  }

  String? _validateInput(String? value) {
    if (!_isTouched) return null;
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }
    final number = int.tryParse(value);
    if (number == null || number < 1 || number > 30) {
      return 'Min 1 max 30';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back, color:  Color.fromARGB(255, 255, 250, 255),)) ,
        title: Text("${widget.category.catageoryName} Quizz", style: const TextStyle(color:  Color.fromARGB(255, 255, 250, 255), fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 53, 84),
      ),
      body:   Column(
        children: [
           const Center(
            child:   Padding(
            padding:  EdgeInsets.only(top: 70),
            child:  Text("Quizz Settings", style: const TextStyle(color: const Color.fromARGB(255, 0, 53, 84), fontSize: 32, fontWeight: FontWeight.bold,) ,),
                    ),
          ),
          const SizedBox(height: 40,),
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 SizedBox(
                  width: 80,
                  child: TextField(
                    controller: _amountController,
                    focusNode: _focusNode,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    
                    decoration: InputDecoration(
                      hintText: "Amount",
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _borderColor),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      errorText: _validateInput(_amountController.text),
                      errorStyle: const TextStyle(height: 0, fontSize: 0),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _isTouched = true;
                      }); 
                    },
                  )
                  ),
                SizedBox(
                  width: 200,
                  child:DropdownButtonFormField(
                    value: dropdownValue,
                    hint: const Text("Difficulty"),
                    onChanged: (String? value){
                      setState(() {
                        dropdownValue = value;
                      });
                      print("Wybrana wartość: $dropdownValue");
                    },
                    items: QuizzSettings.diffList.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(value, style:TextStyle(color: Colors.black, fontSize: 14), textAlign: TextAlign.center,),
                        )
                        );
                    }).toList(),
                    style: TextStyle(color: Colors.black, fontSize: 40),
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