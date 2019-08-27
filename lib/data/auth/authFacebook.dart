import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scalable_app/data/auth/authData.dart' as authData;

final FacebookLogin _fbLogin = new FacebookLogin();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> signInWithFacebook(BuildContext context) async {
  final FacebookLoginResult result = await _fbLogin.logInWithReadPermissions(['email']);
  FacebookAccessToken fbToken = result.accessToken;

  AuthCredential credential = FacebookAuthProvider.getCredential(
      accessToken: fbToken.token
  );

  FirebaseUser user = await
      _auth.signInWithCredential(credential);

  authData.name = user.displayName;
  authData.email = user.email;
  authData.imageUrl = user.photoUrl;

  return user;
}

Future<Null> signOutFacebook() async {
  await _fbLogin.logOut();
//  Scaffold.of(context).showSnackBar(new SnackBar(
//    content: new Text('Sign out button clicked'),
//  ));
  print('Facebook - Signed out');
}