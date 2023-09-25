part of 'imports.dart';

class TablePage extends StatelessWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TableVM>(
      create: (_) => TableVM(),
      child: Scaffold(),
    );
  }
}
