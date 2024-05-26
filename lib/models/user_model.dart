import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String firstName;
  String lastName;
  String phone;
  String email;
  DateTime createdTime;
  String id;
  DocumentReference? reference;
  bool delete;
  String password;

//<editor-fold desc="Data Methods">
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.createdTime,
    required this.id,
    this.reference,
    required this.delete,
    required this.password,
  });



  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    DateTime? createdTime,
    String? id,
    DocumentReference? reference,
    bool? delete,
    String? password,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      createdTime: createdTime ?? this.createdTime,
      id: id ?? this.id,
      reference: reference ?? this.reference,
      delete: delete ?? this.delete,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': this.firstName,
      'lastName': this.lastName,
      'phone': this.phone,
      'email': this.email,
      'createdTime': this.createdTime,
      'id': this.id,
      'reference': this.reference,
      'delete': this.delete,
      'password': this.password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      createdTime: map['createdTime'] as DateTime,
      id: map['id'] as String,
      reference: map['reference'] as DocumentReference,
      delete: map['delete'] as bool,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}