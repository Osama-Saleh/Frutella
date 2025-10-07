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
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      }
      throw CustomException(message: e.message ?? 'An error occurred');
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
