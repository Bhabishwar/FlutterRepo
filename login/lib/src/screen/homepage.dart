import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  final  String  email;
  Homepage({required this.email});
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),

      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop(["Sucess", "Fail"]);

          },
          child: Text("Go Back $email"),
        ),
      ),
    );
  }
}
