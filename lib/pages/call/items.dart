part of 'imports.dart';

AppBar _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryLightColor,
    title: Text(
      lan(t.conversations),
      style: const TextStyle(
        color: kPrimaryColor,
        fontSize: 17.5,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        splashRadius: 25,
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const AddCallPage(recall: null),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        icon: const Icon(
          CupertinoIcons.add,
          color: kPrimaryColor,
          size: 30,
        ),
      ),
      const SizedBox(width: 10),
    ],
  );
}

class _Timeline extends StatelessWidget {
  final Function(DateTime time) select;
  final DateTime selected;

  const _Timeline({
    Key? key,
    required this.select,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      initialDate: selected,
      firstDate: DateTime.now().subtract(
        const Duration(days: 10),
      ),
      lastDate: DateTime.now().add(
        const Duration(days: 71),
      ),
      onDateSelected: select,
      leftMargin: 20,
      monthColor: kPrimaryColor.withOpacity(.9),
      dayColor: kPrimaryColor.withOpacity(.8),
      activeDayColor: Colors.white,
      activeBackgroundDayColor: kPrimaryColor,
      dotsColor: kPrimaryColor,
      locale: 'uz',
    );
  }
}
/*
  late String tel;
  late bool iCalled;
  late DateTime time;
  late String conversation;
 */

class _Item extends StatelessWidget {
  final CallModel call;
  final MaskTextInputFormatter mask;
  final String reception;

  const _Item({
    Key? key,
    required this.call,
    required this.mask,
    required this.reception,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: call.callBack != null
          ? () {
              Navigator.push(
                context,
                PageTransition(
                  child: AddCallPage(recall: call),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            }
          : null,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 3,
        ),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    call.recall != null
                        ? "assets/icons/callback.png"
                        : !call.iCalled
                            ? "assets/icons/incoming.png"
                            : "assets/icons/outcoming.png",
                    height: 22.5,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      mask.maskText(call.tel),
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 17.5,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  call.callBack != null
                      ? Image.asset(
                          "assets/icons/callback.png",
                          height: 22.5,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                call.conversation,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    DateFormat.Hm().format(call.time),
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7.5,
                    ),
                    child: Image.asset(
                      "assets/icons/reception.png",
                      height: 27.5,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      reception,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
