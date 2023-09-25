part of 'imports.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CallVM>(
      create: (_) => CallVM(),
      child: Scaffold(
        backgroundColor: c.white,
        appBar: _appBar(context),
        body: Consumer<CallVM>(
          builder: (context, CallVM vm, _) {
            return Column(
              children: [
                _Timeline(
                  select: vm.selectDate,
                  selected: vm.selected,
                ),
                Expanded(
                  child: vm.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          itemCount: vm.calls.length,
                          itemBuilder: (_, int index) {
                            final call = vm.calls[vm.calls.length - 1 - index];
                            return _Item(
                              call: call,
                              mask: vm.mask,
                              reception: vm.reception(call.reception),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
