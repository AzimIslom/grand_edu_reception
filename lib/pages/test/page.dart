part of 'imports.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TestVM>(
      create: (_) => TestVM(),
      child: Scaffold(),
    );
  }
}
