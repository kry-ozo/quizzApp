class QuizzModel {
  final String type;
  final String difficulty;
  final String category;
  final String question;
  final String correctAnswer;
  List<String> incorrectAnswers;

  QuizzModel({required this.type, required this.difficulty, required this.category, required this.question, required this.correctAnswer, required this.incorrectAnswers});

  factory QuizzModel.fromJson(Map<String, dynamic> json){
    return QuizzModel(
      type: json['type'],
      difficulty: json['difficulty'],
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }
}

