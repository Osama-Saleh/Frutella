import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit/core/services/data_base.dart';

class FirebaseStoreServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      String? docId,
      required Map<String, dynamic> data}) async {
    if (docId == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(data['uid']).set(data);
    }
  }

  Future<dynamic> getData(
      {required String path,
      String? docId,
      Map<String, dynamic>? query}) async {
    if (docId != null) {
      var data = await firestore.collection(path).doc(docId).get();
      return data.data() as Map<String, dynamic>;
    } else {
      Query<Map<String, dynamic>> data = await firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderBy = query['orderBy'];
          var descending = query['descending'] ?? false;
          data = data.orderBy(orderBy, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var resutl = await data.get();
      return resutl.docs.map((e) => e.data()).toList();
    }
  }
}
