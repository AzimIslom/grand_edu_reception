part of 'imports.dart';

/*
  late String tel;
  late bool iCalled;
  late String conversation;
  late DateTime? callBack;
  late String? sent;
 */

class AddCallVM extends ChangeNotifier {
  TextEditingController tel = TextEditingController();
  DateTime? callback;
  bool isLoading = false;
  TextEditingController conversation = TextEditingController();
  bool iCalled = true;
  GroupModel? sent;
  String? group;
  bool sendGroup = false;
  CallModel? recall;
  final mask = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  AddCallVM({
    required this.recall,
  });

  void onChanged(val) {
    notifyListeners();
  }

  void onTel(val) async {
    if (mask.isFill()) {
      final student = await fb.speStudent(mask.unmaskText(tel.text));
      if (student.name != "fake") {
        group = student.groupId;
      } else {
        group = null;
      }
      notifyListeners();
    }
  }

  void caller(bool val) {
    iCalled = val;
    notifyListeners();
  }

  void wantCallback(
    bool val,
    BuildContext context,
  ) async {
    if (val == false) {
      callback = null;
    } else {
      callback = await showDatePicker(
        context: context,
        initialDate: callback ?? DateTime.now().add(const Duration(days: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 70),
        ),
      );
    }
    notifyListeners();
  }

  void selectSendGroup(bool val) {
    sendGroup = val;
    notifyListeners();
  }

  void save(BuildContext context) async {
    if (!mask.isFill() && recall == null) return;
    _();
    CallModel call;
    if (recall == null) {
      call = CallModel(
        conversation: conversation.text.trim(),
        callBack: callback,
        tel: mask.unmaskText(tel.text),
        time: DateTime.now(),
        id: '-1',
        iCalled: iCalled,
        sent: group,
        reception: auth.tel,
        recall: null,
      );
    } else {
      print("elsse:\n\n\n\n\n\n\n\n\n\noew");
      call = CallModel(
        conversation: conversation.text.trim(),
        callBack: null,
        tel: recall!.tel,
        time: DateTime.now(),
        id: '-1',
        iCalled: iCalled,
        sent: recall?.sent,
        reception: auth.tel,
        recall: recall!.id,
      );
    }
    print("dnwoenferno: $call\n\n\n\n\n");
    await fb.addCall(call, recall?.callBack);
    if (recall != null) {
      await fb.updateCall(recall!);
    }
    _();
    Navigator.pop(context);
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
