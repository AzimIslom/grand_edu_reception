class TestModel {
  late String id;
  late List<String> questions;
  late List<String> appliers;
  late List<String> results;
  late DateTime created;
  late DateTime start;
  late DateTime end;

  TestModel({
    required this.id,
    required this.start,
    required this.end,
    required this.questions,
    required this.appliers,
    required this.created,
    required this.results,
  });

  TestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start = DateTime.parse(json['start']);
    end = DateTime.parse(json['end']);
    questions = List.from(json['questions']);
    appliers = List.from(json['appliers']);
    created = DateTime.parse(json['created']);
    results = List.from(json['results']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'start': start.toIso8601String(),
        'end': end.toIso8601String(),
        'questions': questions,
        'appliers': appliers,
        'created': created,
        'results': results,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
