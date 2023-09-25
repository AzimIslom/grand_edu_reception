part of 'imports.dart';

class HomeVM extends ChangeNotifier {
  int currentIndex = 0;
  bool isLoading = false;
  late ReceptionModel reception;

  HomeVM() {
    init();
  }

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void init() async {
    _();
    reception = await fb.speReception(auth.tel);
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
