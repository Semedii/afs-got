  import 'package:afs_gpt/utils/firebase_exception_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    
      Future<void> login(String email, String password) async {
    try {
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      FirebaseExceptionHandler.handleFirebaseError(e);
    }
  }
  }
  
