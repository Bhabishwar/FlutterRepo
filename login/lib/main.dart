import 'package:flutter/material.dart';
import 'package:login/src/screen/login_access_token.dart';
import 'package:login/src/screen/login_screen.dart';

void main ()
{
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginScreen(),
    );
  }
}
