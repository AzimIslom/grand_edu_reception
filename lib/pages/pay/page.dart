part of 'imports.dart';

class PayPage extends StatelessWidget {
  final ReceptionModel reception;

  const PayPage({
    Key? key,
    required this.reception,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PayVM>(
      create: (_) => PayVM(reception),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _PhoneNumber(),
                _Info(),
                _PayInfo(),
                _Pay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
