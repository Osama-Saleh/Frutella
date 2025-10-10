import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/core/errors/custom_extention.dart';

class FirebaseAuthServices {
  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ); 
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'البريد الالكتروني مستخدم من قبل');
      }
      throw CustomException(message: e.message ?? 'حدث خطأ ما');
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
