import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit/core/services/data_base.dart';

class FirebaseStoreServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,String? docId,required Map<String, dynamic> data}) async {
    if (docId == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(data['uid']).set(data);
    }
  }

  Future<Map<String, dynamic>> getData(String path, String docId) async {
    var userData = await firestore.collection(path).doc(docId).get();
    return userData.data() as Map<String, dynamic>;
  }
}
