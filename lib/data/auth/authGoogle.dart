import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scalable_app/data/auth/authData.dart' as authData;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  try {
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn
        .signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
        .authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
    );


    final FirebaseUser user = await _auth.signInWithCredential(credential);

    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

    authData.name = user.displayName;
    authData.email = user.email;
    authData.imageUrl = user.photoUrl;

    name = authData.name;
    email = authData.email;
    imageUrl = authData.imageUrl;

    // Only taking the first part of the name, i.e., First Name
    if (authData.name.contains(" ")) {
      authData.name = authData.name.substring(0, authData.name.indexOf(" "));
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    print("Name: $name, Email: $email, imageUrl: $imageUrl");

    return 'signInWithGoogle succeeded: $user';
  } catch (e) {
    print(e.toString());
  }
}

void signOutGoogle() async {
  await _googleSignIn.signOut();

  authData.isLoggedIn = false;
  authData.mLogMode = authData.LOG_MODE_GUEST;

  print("Google - User Signout.");
}