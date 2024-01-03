class Analysis {
  final double score;
  final String name;
  final String description;
  final bool poisonous;
  final String disease;

  Analysis.empty()
      : score = 0,
        name = '',
        description = '',
        poisonous = false,
        disease = '';

  Analysis({
    required this.score,
    required this.name,
    required this.description,
    required this.poisonous,
    required this.disease,
  });

  factory Analysis.fromJson(Map<String, dynamic> json) {
    return Analysis(
      score: json['score'],
      name: json['name'],
      description: json['description'],
      poisonous: json['poisonous'],
      disease: json['disease'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'name': name,
      'description': description,
      'poisonous': poisonous,
      'disease': disease,
    };
  }
}
