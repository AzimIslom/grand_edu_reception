part of 'imports.dart';

class _BNB extends StatelessWidget {
  const _BNB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, HomeVM vm, _) {
        return FlashyTabBar(
          selectedIndex: vm.currentIndex,
          height: 55,
          showElevation: true,
          onItemSelected: vm.changeIndex,
          iconSize: 20,
          items: [
            FlashyTabBarItem(
              icon: Image.asset(
                "assets/icons/call.png",
                height: 35,
              ),
              title: const Text("Tel"),
            ),
            FlashyTabBarItem(
              icon: Image.asset(
                "assets/icons/pay.png",
                height: 35,
              ),
              title: const Text("To'lov"),
            ),
            FlashyTabBarItem(
              icon: Image.asset(
                "assets/icons/account.png",
                height: 35,
              ),
              title: const Text('Akk'),
            ),
            // FlashyTabBarItem(
            //   icon: Image.asset(
            //     "assets/icons/attendence.png",
            //     height: 35,
            //   ),
            //   title: const Text("Odam"),
            // ),
            FlashyTabBarItem(
              icon: Image.asset(
                "assets/icons/test.png",
                height: 35,
              ),
              title: const Text("Test"),
            ),
          ],
        );
      },
    );
  }
}

class _Unable extends StatelessWidget {
  const _Unable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        lan(t.unable),
        style: const TextStyle(
          color: kPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
