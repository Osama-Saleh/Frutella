import 'dart:convert';

import 'package:fruit/core/app_constant/app_constant.dart';
import 'package:fruit/core/services/shared_prefrences.dart';
import 'package:fruit/features/auth/data/model/user_model.dart';
import 'package:fruit/features/auth/demain/entites/user_entity.dart';

UserEntity GetUserData() {
  String userData = SharedPrefrencesService.getString(AppConstant.saveUserDataKey);
  Map<String, dynamic> userMap = jsonDecode(userData);
  return UserModel.fromMap(userMap);
}