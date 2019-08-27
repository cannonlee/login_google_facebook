import 'package:google_sign_in/google_sign_in.dart';

const LOG_MODE_GUEST = 0;
const LOG_MODE_GOOGLE = 1;
const LOG_MODE_FACEBOOK = 2;

bool isLoggedIn = false;
int mLogMode = LOG_MODE_GUEST;

String name;
String email;
String imageUrl;