import 'package:dart_either/src/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/core/errors/custom_extention.dart';
import 'package:fruit/core/errors/failures.dart';
import 'package:fruit/features/auth/data/model/user_model.dart';
import 'package:fruit/features/auth/demain/entites/user_entity.dart';
import 'package:fruit/features/auth/demain/repos/auth_repo.dart';

import '../../../../core/services/firebase_auth_services.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required String? name}) async {
    try {
      User user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);

      return Right(UserModel.formFireBaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(" AuthRepoImpl signInWithEmailAndPassword ${e.toString()}"));
    }
  }
}
