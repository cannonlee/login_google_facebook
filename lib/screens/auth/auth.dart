import 'package:flutter/material.dart';
import 'widgets/googleButton/index.dart';
import 'widgets/facebookButton/index.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Auth"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new GoogleButton(),
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new FacebookButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}