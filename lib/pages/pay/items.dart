part of 'imports.dart';

class _PhoneNumber extends StatelessWidget {
  const _PhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PayVM>(
      builder: (context, PayVM vm, _) {
        return TextField(
          autocorrect: false,
          controller: vm.phone,
          cursorColor: kPrimaryColor,
          inputFormatters: [
            vm.mask,
          ],
          onChanged: (a) {
            vm.onChanged();
          },
          keyboardType: TextInputType.phone,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: lan(t.tel),
          ),
        );
      },
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PayVM>(
      builder: (context, PayVM vm, _) {
        return vm.student == null
            ? const SizedBox.shrink()
            : vm.isLoading
                ? const SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    ),
                  )
                : vm.student?.name == "fake"
                    ? Text(
                        lan(t.noTelStudent),
                        style: const TextStyle(
                          color: kPrimaryColor,
                          height: 2,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(color: kPrimaryColor),
                          Text(
                            "${vm.student!.name} ${vm.student!.surname}",
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${lan(t.leftLessons)}: ${vm.student!.lessons}",
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${lan(t.group)}: ${vm.group.name}, ${DateFormat.Hm().format(vm.group.start)}, ${lan(vm.group.odd ? t.odd : t.even)}",
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
      },
    );
  }
}

class _PayInfo extends StatelessWidget {
  const _PayInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PayVM>(
      builder: (context, PayVM vm, _) {
        return vm.student?.name == "fake" || vm.student?.name == null
            ? const SizedBox.shrink()
            : Column(
                children: [
                  const Divider(color: kPrimaryColor),
                  TextField(
                    autocorrect: false,
                    controller: vm.num,
                    cursorColor: kPrimaryColor,
                    inputFormatters: [
                      vm.maskNum,
                    ],
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: lan(t.sum),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    autocorrect: false,
                    controller: vm.lesson,
                    cursorColor: kPrimaryColor,
                    inputFormatters: [
                      vm.maskLesson,
                    ],
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: lan(t.addLessons),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    autocorrect: false,
                    controller: vm.des,
                    cursorColor: kPrimaryColor,
                    textInputAction: TextInputAction.newline,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: null,
                    maxLength: 300,
                    decoration: InputDecoration(
                      hintText: lan(t.comment),
                    ),
                  ),
                ],
              );
      },
    );
  }
}

class _Pay extends StatelessWidget {
  const _Pay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PayVM>(
      builder: (context, PayVM vm, _) {
        return vm.student?.name == "fake" || vm.student?.name == null
            ? const SizedBox.shrink()
            : Column(
                children: [
                  const Divider(color: kPrimaryColor),
                  ElevatedButton(
                    onPressed: vm.pay,
                    child: Text(
                      lan(t.pay),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
