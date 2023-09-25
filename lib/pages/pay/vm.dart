part of 'imports.dart';

//99033091
class PayVM extends ChangeNotifier {
  TextEditingController phone = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController lesson = TextEditingController();
  StudentModel? student;
  late GroupModel group;
  bool isLoading = false;
  late ReceptionModel reception;

  PayVM(this.reception);

  final mask = MaskTextInputFormatter(
      mask: '## ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: "");
  final maskNum = MaskTextInputFormatter(
      mask: '### ###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: "");

  final maskLesson = MaskTextInputFormatter(
      mask: '##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
      initialText: "");

  void onChanged() async {
    if (mask.isFill()) {
      _();
      FocusManager.instance.primaryFocus?.unfocus();
      if ((await Vibration.hasCustomVibrationsSupport()) == true) {
        Vibration.vibrate(duration: 500);
      } else {
        Vibration.vibrate().then((value) async {
          await Future.delayed(const Duration(milliseconds: 500));
          Vibration.vibrate();
        });
      }
      student = await fb.speStudent(mask.unmaskText(phone.text));
      if (student!.name != "fake") {
        group = await fb.speGroup(student!.groupId);
      }
      _();
    } else {
      student = null;
      notifyListeners();
    }
  }

  void pay() async {
    _();
    final PayModel pay = PayModel(
      time: DateTime.now(),
      des: des.text,
      id: '-1',
      getter: reception.tel,
      lessons: int.parse(lesson.text),
      payer: mask.unmaskText(phone.text),
      sum: int.parse(maskNum.unmaskText(num.text)),
    );
    student!.lessons += int.parse(lesson.text);
    await fb.pay(pay);
    await fb.saveStudent(student!);
    student = null;
    phone.clear();
    des.clear();
    lesson.clear();
    num.clear();
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
