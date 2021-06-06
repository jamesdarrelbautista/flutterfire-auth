import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  // the reason for this constructor is so that we can pass the actual firebase auth class coming from firebase sdk

  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Future<void> signOut async {
  //   await _firebaseAuth.signOut();
  // }

  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in!";
    } on FirebaseAuthException catch (e) {
      return "did not sign in";
    }
  }

  Future<String> signOut(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up!";
    } on FirebaseAuthException catch (e) {
      return "did not sign out";
    }
  }
}
