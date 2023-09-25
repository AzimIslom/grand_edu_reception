class CallHistoryModel {
  late String tel;
  late String id;

  CallHistoryModel({
    required this.tel,
    required this.id,
  });

  CallHistoryModel.fromJson(Map<String, dynamic> json) {
    tel = json['tel'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() => {
        'tel': tel,
        'id': id,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
