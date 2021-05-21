import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  int a =0;
  int b =0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Banking Software"),

        ),

        floatingActionButton: FloatingActionButton(
          onPressed: ()
          {
            setState(() {
              a ++;
              b=a++;
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
        body: Text("$b"),
      ),
    );
  }
}
