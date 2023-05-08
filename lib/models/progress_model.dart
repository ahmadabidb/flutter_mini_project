class Progress {
  int? id;
  String date;
  double weight;
  double height;

  Progress({
    this.id,
    required this.date,
    required this.weight,
    required this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'weight': weight,
      'height': height,
    };
  }

  static Progress fromMap(Map<String, dynamic> map) {
    return Progress(
      id: map['id'],
      date: map['date'],
      weight: map['weight'],
      height: map['height'],
    );
  }
}
