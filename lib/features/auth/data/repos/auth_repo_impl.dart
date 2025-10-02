import 'package:dart_either/src/dart_either.dart';
import 'package:fruit/core/errors/failures.dart';
import 'package:fruit/features/auth/demain/entites/user_entity.dart';
import 'package:fruit/features/auth/demain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({required String email, required String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

}