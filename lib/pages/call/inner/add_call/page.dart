part of 'imports.dart';

class AddCallPage extends StatelessWidget {
  final CallModel? recall;

  const AddCallPage({
    Key? key,
    required this.recall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddCallVM>(
      create: (_) => AddCallVM(recall: recall),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                _Tel(),
                _WhoCalled(),
                _Callback(),
                _SendGroup(),
                _Conversation(),
                SizedBox(height: 10),
                _Save(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
