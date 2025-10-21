import 'package:dart_either/dart_either.dart';
import 'package:fruit/core/errors/failures.dart';
import 'package:fruit/features/auth/demain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String? name,
  });

  Future<Either<Failures, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future deleteUserData();

  Future<void> addUserData({required UserEntity user, required String docId});

  Future<UserEntity> getUserData({required String uid});


}
