import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grand_edu_reception/models/call_history_model.dart';
import 'package:grand_edu_reception/models/call_model.dart';
import 'package:grand_edu_reception/models/group_model.dart';
import 'package:grand_edu_reception/models/pay_model.dart';
import 'package:grand_edu_reception/models/student_model.dart';
import '../models/reception_model.dart';
import '../models/teacher_model.dart';
import '../utils/api.dart';

final fb = FBService();
final _fb = FirebaseFirestore.instance;

class FBService {
  //*********************************************
  //*********************************************
  //*********************************************
  //*********************************************
  //*********************************************
  ///add
  Future<String?> addStudent(StudentModel student) async {
    try {
      await _fb
          .collection(api.apiStudents)
          .doc(student.tel)
          .set(student.toJson());
      await addStudentGroup(student.groupId, student.tel);
      return null;
    } catch (e) {
      print("addStudent: $e\n\n\n\n\n\n\n\n");
      return e.toString();
    }
  }

  Future<void> addCall(CallModel call, [DateTime? date2]) async {
    if (call.sent != null) {
      await addCallGroup(call);
    }
    DateTime b;
    if (call.callBack != null) {
      b = call.callBack!;
    } else {
      b = call.time;
    }
    b = date2 ?? b;
    String date = "${b.year}.${b.month}.${b.day}";
    await _fb
        .collection(api.calls)
        .doc(date)
        .collection(call.tel)
        .add(call.toJson())
        .then(
      (value) async {
        call.id = value.id;
        await _fb
            .collection(api.calls)
            .doc(date)
            .collection(call.tel)
            .doc(call.id)
            .set(call.toJson());
      },
    );
    final history = CallHistoryModel(tel: call.tel, id: call.id);
    await _fb.collection(api.calls).doc(date).collection(api.calls).add(
          history.toJson(),
        );
  }

  Future<void> addCallGroup(CallModel call) async {
    await _fb
        .collection(api.calls)
        .doc(api.group)
        .collection(call.sent!)
        .add(call.toJson())
        .then(
      (value) async {
        call.id = value.id;
        await _fb
            .collection(api.calls)
            .doc(api.group)
            .collection(call.sent!)
            .doc(call.id)
            .set(call.toJson());
      },
    );
  }

  Future<void> pay(PayModel pay) async {
    await _fb
        .collection(api.pay)
        .doc(pay.payer)
        .collection(pay.payer)
        .add(pay.toJson())
        .then(
      (value) async {
        pay.id = value.id;
        await _fb
            .collection(api.pay)
            .doc(pay.payer)
            .collection(pay.payer)
            .doc(pay.id)
            .update(pay.toJson());
      },
    );
  }

  //*********************************************
  //*********************************************
  //*********************************************
  //*********************************************
  //*********************************************
  ///special
  Future<ReceptionModel> speReception(String id) async {
    try {
      final json = await _fb.collection(api.apiReceptions).doc(id).get();
      final reception = ReceptionModel.fromJson(json.data()!);
      return reception;
    } catch (e) {
      return ReceptionModel(
        features: [],
        name: 'fake',
        branch: '',
        password: '',
        tel: '',
        surname: '',
      );
    }
  }

  Future<StudentModel> speStudent(String id) async {
    try {
      print(id);
      final json = await _fb.collection(api.apiStudents).doc(id).get();
      final student = StudentModel.fromJson(json.data()!);
      return student;
    } catch (e) {
      return StudentModel(
        name: 'fake',
        password: '',
        tel: '',
        surname: '',
        groupId: '',
        xp: 0,
        lessons: 1,
        by: '',
      );
    }
  }

  Future<GroupModel> speGroup(String id) async {
    return GroupModel.fromJson(
      (await _fb.collection(api.group).doc(id).get()).data()!,
    );
  }

//*********************************************
//*********************************************
//*********************************************
//*********************************************
//*********************************************
  ///update
  Future<void> updateCall(CallModel call) async {
    final b = call.callBack!;
    final date = "${b.year}.${b.month}.${b.day}";
    call.callBack = null;
    await _fb
        .collection(api.calls)
        .doc(date)
        .collection(call.tel)
        .doc(call.id)
        .update(call.toJson());
  }

  Future<void> saveReception(ReceptionModel reception) async {
    await _fb
        .collection(api.apiReceptions)
        .doc(reception.tel)
        .set(reception.toJson());
  }

  Future<void> addStudentGroup(String group, String student) async {
    final g = await speGroup(group);
    g.students.add(student);
    await updateGroup(g);
  }

  Future<void> updateGroup(GroupModel group) async {
    await _fb.collection(api.group).doc(group.id).update(group.toJson());
  }

  Future<void> saveStudent(StudentModel student) async {
    await _fb
        .collection(api.apiStudents)
        .doc(student.tel)
        .set(student.toJson());
  }

  //*********************************************
//*********************************************
//*********************************************
//*********************************************
//*********************************************
  /// get
  Future<List<CallModel>> calls(String date) async {
    final telsJson =
        await _fb.collection(api.calls).doc(date).collection(api.calls).get();
    final List<CallHistoryModel> history = telsJson.docs
        .map(
          (e) => CallHistoryModel.fromJson(
            e.data(),
          ),
        )
        .toList();
    Set<String> tels = history.map((e) => e.tel).toSet();
    List<CallModel> calls = [];
    for (var i in tels) {
      final json =
          await _fb.collection(api.calls).doc(date).collection(i).get();
      calls.addAll(json.docs.map((e) => CallModel.fromJson(e.data())));
    }
    return calls;
  }

  Future<List<GroupModel>> groups() async {
    try {
      final data = await _fb.collection(api.group).get();
      final result = data.docs
          .map(
            (e) => GroupModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("groups: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<TeacherModel>> teachers() async {
    try {
      final data = await _fb.collection(api.apiTeachers).get();
      final result = data.docs
          .map(
            (e) => TeacherModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("teachers: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<ReceptionModel>> receptions() async {
    try {
      final data = await _fb.collection(api.apiReceptions).get();
      final result = data.docs
          .map(
            (e) => ReceptionModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("teachers: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }
}
