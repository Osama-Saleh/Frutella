import 'package:dart_either/dart_either.dart';
import 'package:fruit/core/errors/failures.dart';
import 'package:fruit/features/auth/demain/entites/user_entity.dart';

abstract class AuthRepo {
  
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
    required String? name,
  });

  Future<Either<Failures, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}