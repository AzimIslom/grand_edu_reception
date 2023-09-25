class CallModel {
  late String tel;
  late DateTime? callBack;
  late String conversation;
  late bool iCalled;
  late DateTime time;
  late String? sent;
  late String id;
  late String reception;
  late String? recall;

  CallModel({
    required this.conversation,
    required this.callBack,
    required this.tel,
    required this.time,
    required this.id,
    required this.iCalled,
    required this.sent,
    required this.reception,
    required this.recall,
  });

  CallModel.fromJson(Map<String, dynamic> json) {
    tel = json['tel'];
    time = DateTime.parse(json['time']);
    callBack =
        json['callBack'] != null ? DateTime.tryParse(json['callBack']) : null;
    conversation = json['conversation'];
    id = json['id'];
    iCalled = json['iCalled'];
    sent = json['sent'];
    reception = json['reception'];
    recall = json['recall'];
  }

  Map<String, dynamic> toJson() => {
        'tel': tel,
        'time': time.toIso8601String(),
        'callBack': callBack?.toIso8601String(),
        'conversation': conversation,
        'id': id,
        'iCalled': iCalled,
        'sent': sent,
        'reception': reception,
        'recall': recall,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
