part of 'imports.dart';

class CallVM extends ChangeNotifier {
  DateTime selected = DateTime.now();
  bool isLoading = false;
  List<ReceptionModel> receptions = [];
  List<CallModel> calls = [];
  final mask = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  CallVM() {
    initReceptions();
    init();
  }

  void init() async {
    _();
    final String date = "${selected.year}.${selected.month}.${selected.day}";
    calls = await fb.calls(date);
    _();
  }

  void initReceptions() async {
    _();
    receptions = await fb.receptions();
    _();
  }

  void selectDate(DateTime time) {
    selected = time;
    init();
  }

  String reception(String id) {
    print(id);
    final r = receptions.firstWhere((element) => element.tel == id);
    return "${r.name} ${r.surname}";
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
