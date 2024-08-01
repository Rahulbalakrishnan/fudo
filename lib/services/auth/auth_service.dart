import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // GET INSTANCE OF THE FIREBASE AUTH
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // GET CURRENT USER
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // SIGN IN
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    // TRY SIGN IN USER
    try {
      // SIGN IN USER
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    // CATCH ANY ERRORS
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // SIGN UP
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    // TRY SIGN UP USER
    try {
      // SIGN UP USER
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    // CATCH ANY ERRORS
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // SIGN OUT
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
