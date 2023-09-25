part of 'imports.dart';

class _Tel extends StatelessWidget {
  const _Tel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCallVM>(
      builder: (context, AddCallVM vm, _) {
        return vm.recall != null
            ? const SizedBox.shrink()
            : TextField(
                onChanged: vm.onTel,
                controller: vm.tel,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                autocorrect: false,
                cursorColor: kPrimaryColor,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
                inputFormatters: [
                  vm.mask,
                ],
                decoration: InputDecoration(
                  hintText: lan(t.tel),
                ),
              );
      },
    );
  }
}

class _WhoCalled extends StatelessWidget {
  const _WhoCalled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCallVM>(
      builder: (context, AddCallVM vm, _) {
        return CheckboxListTile(
          activeColor: kPrimaryColor,
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          checkColor: c.white,
          value: vm.iCalled,
          title: Text(
            lan(t.iCalled),
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          onChanged: (val) {
            vm.caller(val == true);
          },
        );
      },
    );
  }
}

class _Conversation extends StatelessWidget {
  const _Conversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCallVM>(
      builder: (context, AddCallVM vm, _) {
        return TextField(
          onChanged: vm.onChanged,
          textInputAction: TextInputAction.newline,
          autocorrect: false,
          maxLength: vm.conversation.text.length > 500 ? 700 : null,
          controller: vm.conversation,
          maxLines: null,
          cursorColor: kPrimaryColor,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: lan(t.conversation),
          ),
        );
      },
    );
  }
}

class _SendGroup extends StatelessWidget {
  const _SendGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCallVM>(
      builder: (context, AddCallVM vm, _) {
        return vm.group == null && vm.recall != null
            ? const SizedBox.shrink()
            : CheckboxListTile(
                activeColor: kPrimaryColor,
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                checkColor: c.white,
                value: vm.sendGroup,
                title: Text(
                  lan(t.sendGroup),
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onChanged: (val) {
                  vm.selectSendGroup(val == true);
                },
              );
      },
    );
  }
}

class _Callback extends StatelessWidget {
  const _Callback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCallVM>(
      builder: (context, AddCallVM vm, _) {
        return vm.recall != null
            ? const SizedBox.shrink()
            : Column(
                children: [
                  CheckboxListTile(
                    activeColor: kPrimaryColor,
                    subtitle: vm.callback != null
                        ? Text(
                            DateFormat.yMd().format(vm.callback!),
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : null,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    checkColor: c.white,
                    title: Text(
                      lan(t.wantCallBack),
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    value: vm.callback != null,
                    onChanged: (val) {
                      vm.wantCallback(val == true, context);
                    },
                  ),
                ],
              );
      },
    );
  }
}

class _Save extends StatelessWidget {
  const _Save({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCallVM>(
      builder: (context, AddCallVM vm, _) {
        return vm.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      vm.save(context);
                    },
                    child: Text(
                      lan(t.save),
                      style: TextStyle(
                        color: c.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryLightColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      lan(t.back),
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
