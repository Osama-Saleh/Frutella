import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/features/auth/demain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.email, required super.name});

  factory UserModel.formFireBaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      name: user.displayName,
    );
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ,
      email: map['email'],
      name: map['name'],
    );
  }
}