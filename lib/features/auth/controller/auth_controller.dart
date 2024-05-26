import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ontrend/features/auth/screens/login_page.dart';
import 'package:ontrend/features/home/screens/bottom_nav.dart';
import 'package:ontrend/models/user_model.dart';

import '../../../core/firbaseConstants/firebase_constants.dart';
import '../../../core/utils.dart';
import '../repository/auth_repository.dart';

final authControllerProvider = NotifierProvider<AuthController, bool>(() {
  return AuthController();
});

class AuthController extends Notifier<bool> {
  AuthRepository get _authRepository => ref.read(authRepositoryProvider);

  void creatuser({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    var userId = await _authRepository.getUsersCount();
    DocumentReference reference = FirebaseFirestore.instance
        .collection(FirebaseConstants.usersCollection)
        .doc(userId);

    UserModel userModel = UserModel(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        reference: reference,
        createdTime: DateTime.now(),
        id: reference.id,
        delete: false,
        password: password);

    final res = await _authRepository.createUsers(
        email: email, phone: phone, reference: reference, userModel: userModel);

    res.fold((l) => showSnackBar(context, l.toString()), (r) {
      showSnackBar(context, "User Created");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
  }

  Future loginUser({
    required String username,
    required String password,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final res = await _authRepository.loginUser(
        username: username, password: password, ref: ref);
    res.fold((l) {
      print("error");
      print(l);
      showSnackBar(context, l.toString());
    }, (r) {
      showSnackBar(context, "Logged Successfully");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNav(),
          ),
          (route) => false);
    });
  }

  @override
  bool build() {
    return false;
    // TODO: implement build
    throw UnimplementedError();
  }
}
