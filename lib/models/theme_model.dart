class ThemeModel {
  late int unit;
  late String title;

  ThemeModel({
    required this.unit,
    required this.title,
  });

  ThemeModel.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() => {
        'unit': unit,
        'title': title,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
