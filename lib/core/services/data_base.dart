
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataBaseServices {
  Future<void> addData({required String path,String? docId,required Map<String, dynamic> data});

  Future<dynamic> getData({required String path,  String? docId,Map<String, dynamic>? query});
}