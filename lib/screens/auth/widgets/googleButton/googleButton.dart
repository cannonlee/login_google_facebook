import 'package:flutter/material.dart';
import 'package:scalable_app/screens/Home.dart';
import 'package:scalable_app/data/auth/authGoogle.dart';
import 'package:scalable_app/data/auth/authData.dart' as authData;

class GoogleButton extends StatefulWidget {

  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  var mContext;

  void onLoginStatusChanged(bool isLoggedIn) {
    authData.isLoggedIn = isLoggedIn;
    authData.mLogMode = authData.LOG_MODE_GOOGLE;
    Navigator.of(mContext).push(
        MaterialPageRoute(
          builder: (mContext) {
            return HomeScreen();
          },
        )
    );
  }

  Widget build(BuildContext context) {
    mContext = context;
//    return new AppButton(
//      buttonName: "Google",
//      onPressed: null,
//      buttonTextStyle: null,
//    );
    return _googleSignInButton();
  }

  Widget _googleSignInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          onLoginStatusChanged(true);
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}