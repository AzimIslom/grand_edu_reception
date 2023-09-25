class CatModel {
  late int id;
  late String title;
  late String des;
  late int theme;

  CatModel({
    required this.title,
    required this.id,
    required this.des,
    required this.theme,
  });

  CatModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    des = json['des'];
    theme = json['theme'];
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'des': des,
        'theme': theme,
      };
}
