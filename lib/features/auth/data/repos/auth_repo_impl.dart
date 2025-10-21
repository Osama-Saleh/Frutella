import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit/core/app_constant/backend_end_point.dart';
import 'package:fruit/core/errors/custom_extention.dart';
import 'package:fruit/core/errors/failures.dart';
import 'package:fruit/core/services/data_base.dart';
import 'package:fruit/core/services/firebase_store_sevices.dart';
import 'package:fruit/features/auth/data/model/user_model.dart';
import 'package:fruit/features/auth/demain/entites/user_entity.dart';
import 'package:fruit/features/auth/demain/repos/auth_repo.dart';

import '../../../../core/services/firebase_auth_services.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DataBaseServices firebaseStoreServices;

  AuthRepoImpl(
      {required this.firebaseAuthServices,
      required this.firebaseStoreServices});

  @override
  Future<Either<Failures, UserEntity>> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String? name}) async {
    try {
      User user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      user.displayName;
      UserEntity userData = UserEntity(
          uid: user.uid, email: user.email ?? '', name: name);
      //! Using fromMap factory constructor or UserEntity directly is also fine
      // UserEntity userData = UserModel.fromMap({
      //   'uid': user.uid,
      //   'email': user.email ?? '',
      //   'name': name,
      // });
      await addUserData(user: userData, docId: user.uid);
      return Right(userData);
    } on CustomException catch (e) {
      await deleteUserData();
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUserData();
      return Left(ServerFailure(
          " AuthRepoImpl signInWithEmailAndPassword ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      User user = await firebaseAuthServices.loginWithEmailAndPassword(
          email: email, password: password);
   UserEntity userEntity =  await getUserData(uid: user.uid);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(
          " AuthRepoImpl loginWithEmailAndPassword ${e.toString()}"));
    }
  }

  @override
  Future deleteUserData() async {
    await firebaseAuthServices.deleteUser();
  }

  @override
  Future<void> addUserData({required UserEntity user,required String docId}) async {
    await firebaseStoreServices.addData(
        path: BackendEndPoint.addUserPath,docId: docId ,data: user.toMap());
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    Map<String,dynamic> userMap = await firebaseStoreServices.getData(BackendEndPoint.getUserPath, uid);
    return UserModel.fromMap(userMap);
  }
}
