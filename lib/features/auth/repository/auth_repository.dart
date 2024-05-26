import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ontrend/core/utils.dart';

import '../../../core/failure.dart';
import '../../../core/firbaseConstants/firebase_constants.dart';
import '../../../core/typedef.dart';
import '../../../models/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(firestore: FirebaseFirestore.instance);
});

class AuthRepository {
  final FirebaseFirestore _firestore;
  AuthRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;
  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);
  CollectionReference get _settings =>
      _firestore.collection(FirebaseConstants.settingsCollection);

  FutureVoid createUsers({
    required String email,
    required String phone,
    required DocumentReference reference,
    required UserModel userModel,
  }) async {
    try {
      var userEmail = await _users.where("email", isEqualTo: email).get();
      var userPhn = await _users.where("phone", isEqualTo: phone).get();

      if (userEmail.docs.isNotEmpty) {
        throw "Email is Already Registered";
      } else if (userPhn.docs.isNotEmpty) {
        throw "Phone number is already registered";
      }
      return right(reference.set(userModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid loginUser({
    required String username,
    required String password,
    required WidgetRef ref,
  }) async {
    try {
      var userData = await _users
          .where(Filter.or(Filter("email", isEqualTo: username),
              Filter("phone", isEqualTo: username)))
          .where("password", isEqualTo: password)
          .get();
      // UserModel usermodel=  UserModel.fromMap(userData.docs.first.data() as Map<String,dynamic>);
      // ref.read(currentUserProvider.notifier).state =usermodel;

      if (userData.docs.isEmpty) {
        throw "User Not Found";
      }
      return right(userData);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<String> getUsersCount() async {
    var userId = await _settings.doc("settings").get();
    await userId.reference.update({
      "users": FieldValue.increment(1),
    });
    return "U${userId.get("users")}";
  }
}
