class StudentModel {
  late String groupId;
  late String tel;
  late String name;
  late String surname;
  late String? password;
  late int xp;
  late int lessons;
  late String by;

  StudentModel({
    required this.surname,
    required this.name,
    required this.tel,
    required this.password,
    required this.groupId,
    required this.xp,
    required this.lessons,
    required this.by,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    surname = json['surname'];
    name = json['name'];
    tel = json['tel'];
    password = json['password'];
    groupId = json['groupId'];
    xp = json['xp'] ?? 0;
    lessons = json['lessons'] ?? 0;
    by = json['by'] ?? "no";
  }

  Map<String, dynamic> toJson() => {
        'surname': surname,
        'name': name,
        'tel': tel,
        'password': password,
        'groupId': groupId,
        'xp': xp,
        'lessons': lessons,
        "by": by,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
