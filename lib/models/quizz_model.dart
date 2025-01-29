class QuizzModel {
  final String type;
  final String difficulty;
  final String category;
  final String question;
  final String correctAnswer;

  QuizzModel({required this.type, required this.difficulty, required this.category, required this.question, required this.correctAnswer});

  factory QuizzModel.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'type' : String type,
        'difficulty' : String difficulty,
        'category' : String category,
        'question' : String question,
        'correct_anwear' : String correctAnswer
      }
      => QuizzModel(type: type, difficulty: difficulty, category: category, question: question, correctAnswer: correctAnswer),
      _=> throw const FormatException("Failed to load question"),
    };
  }
}

