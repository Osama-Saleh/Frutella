import 'package:fruit/features/auth/demain/entites/user_entity.dart';

abstract class DataBaseServices {
  Future<void> addData({required String path,String? docId,required Map<String, dynamic> data});

  Future<Map<String,dynamic>> getData(String path, String docId);
}