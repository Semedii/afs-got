
import 'package:afs_gpt/utils/app_toaster.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExceptionHandler {
  static handleFirebaseError(FirebaseException error) {
    switch (error.code) {
      case 'invalid-credential':
        toastInfo("Wrong email or password");
        break;
      default:
        toastInfo("An error occurred: ${error.message}");
    }
  }
}
