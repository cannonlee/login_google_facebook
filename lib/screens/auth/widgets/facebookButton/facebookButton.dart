import 'package:flutter/material.dart';
import 'package:scalable_app/data/auth/authFacebook.dart';
import 'package:scalable_app/screens/Home.dart';
import 'package:scalable_app/widgets/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:scalable_app/data/auth/authData.dart' as authData;

class FacebookButton extends StatelessWidget {
  bool isLoggedIn = false;
  var mContext;
  var token, graphResponse, profile;

  void onLoginStatusChanged(bool isLoggedIn) {
    authData.isLoggedIn = isLoggedIn;
    if (isLoggedIn) {
      authData.mLogMode = authData.LOG_MODE_FACEBOOK;
    } else {
      authData.mLogMode = authData.LOG_MODE_GUEST;
    }
    Navigator.of(mContext).push(
        MaterialPageRoute(
          builder: (mContext) {
            return HomeScreen();
          },
        )
    );
  }
//
//  void initiateFacebookLogin() async {
//    var facebookLogin = FacebookLogin();
//    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
//    var facebookLoginResult =
//    await facebookLogin.logInWithReadPermissions(['email']);
//    switch (facebookLoginResult.status) {
//      case FacebookLoginStatus.error:
//        print("Error");
//        onLoginStatusChanged(false);
//        break;
//      case FacebookLoginStatus.cancelledByUser:
//        print("CancelledByUser");
//        onLoginStatusChanged(false);
//        break;
//      case FacebookLoginStatus.loggedIn:
//        print("LoggedIn");
//        token = facebookLoginResult.accessToken.token;
//        graphResponse = await http.get(
//            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${token}');
//        profile = jsonDecode(graphResponse.body);
//        print(profile);
//
//        authData.name = profile['name'];
//        authData.email = profile['email'];
//        authData.imageUrl = profile['picture']['data']['url'];
//
//        onLoginStatusChanged(true);
//        break;
//    }
//  }

  Widget build(BuildContext context) {
    mContext = context;
    return new AppButton(
      buttonName: "Facebook",
//      onPressed: initiateFacebookLogin,
      onPressed: () => signInWithFacebook(context)
          .then((FirebaseUser user) => print(user))
          .catchError((e) => print(e)).whenComplete(() {
        onLoginStatusChanged(true);
      }),
      buttonTextStyle: null,
    );
  }
}