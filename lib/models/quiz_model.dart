import 'dart:convert';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  final Questionario questionario;

  Quiz({
    required this.questionario,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    questionario: Questionario.fromJson(json["questionario"]),
  );

  Map<String, dynamic> toJson() => {
    "questionario": questionario.toJson(),
  };
}

class Questionario {
  final int id;
  final String titulo;
  final List<Questoes> questoes;

  Questionario({
    required this.id,
    required this.titulo,
    required this.questoes,
  });

  factory Questionario.fromJson(Map<String, dynamic> json) => Questionario(
    id: json["id"],
    titulo: json["titulo"],
    questoes: List<Questoes>.from(json["questoes"].map((x) => Questoes.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "questoes": List<dynamic>.from(questoes.map((x) => x.toJson())),
  };
}

class Questoes {
  final int id;
  final String titulo;
  final String pergunta;
  final int gabarito;
  int? userAnswer;
  final List<Alternativa> alternativas;

  Questoes({
    required this.id,
    required this.titulo,
    required this.pergunta,
    required this.gabarito,
    required this.userAnswer,
    required this.alternativas,
  });

  factory Questoes.fromJson(Map<String, dynamic> json) => Questoes(
    id: json["id"],
    titulo: json["titulo"],
    pergunta: json["pergunta"],
    gabarito: json["gabarito"],
    userAnswer: json["userAnswer"],
    alternativas: List<Alternativa>.from(json["alternativas"].map((x) => Alternativa.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "pergunta": pergunta,
    "gabarito": gabarito,
    "userAnswer": userAnswer,
    "alternativas": List<dynamic>.from(alternativas.map((x) => x.toJson())),
  };
}

class Alternativa {
  final int id;
  final String titulo;

  Alternativa({
    required this.id,
    required this.titulo,
  });

  factory Alternativa.fromJson(Map<String, dynamic> json) => Alternativa(
    id: json["id"],
    titulo: json["titulo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
  };
}