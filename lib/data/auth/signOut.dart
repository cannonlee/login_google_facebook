import 'package:scalable_app/data/auth/authData.dart' as authData;
import 'package:scalable_app/data/auth/authGoogle.dart';
import 'package:scalable_app/data/auth/authFacebook.dart';


void validateSignOut() {
  if (authData.isLoggedIn) {
    switch (authData.mLogMode) {
      case authData.LOG_MODE_GOOGLE: {
        signOutGoogle();
        break;
      }
      case authData.LOG_MODE_FACEBOOK: {
        signOutFacebook();
        break;
      }
    }
  }
}