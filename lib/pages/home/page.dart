part of 'imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeVM>(
      create: (_) => HomeVM(),
      child: Scaffold(
        backgroundColor: c.white,
        // appBar: AppBar(),
        body: Consumer<HomeVM>(
          builder: (context, HomeVM vm, _) {
            return vm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : [
                    vm.reception.features.contains("call")
                        ? const CallPage()
                        : const _Unable(),
                    vm.reception.features.contains("pay")
                        ? PayPage(reception: vm.reception)
                        : const _Unable(),
                    vm.reception.features.contains("account")
                        ? const AddStudentPage()
                        : const _Unable(),
                    // vm.reception.features.contains("attendence")
                    //     ? const TablePage()
                    //     : const _Unable(),
                    vm.reception.features.contains("test")
                        ? const TestPage()
                        : const _Unable(),
                  ][vm.currentIndex];
          },
        ),
        bottomNavigationBar: const _BNB(),
      ),
    );
  }
}
