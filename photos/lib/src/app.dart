import 'dart:convert';

/// 1. Import the standart Material
/// 2. extend the statelesswidget
/// 3.override
/// 4.return app
/// 5.import main.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:photos/src/widgets/images_list_widget.dart';

import 'models/images_responses_model.dart';

///1.create the two class one for state and other for widget
///2. override the *createState* method on the widget class and return the intance of the state class
///3. one the state class extend  the state class
///4. update the ui on the screen
///

class App extends StatefulWidget {
  @override
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageResponseModel> imagelist =[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gcs Banking"),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fetchImage();

            print("Button Is Click $counter");
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        body: ImageListWidget(imagelist),
      ),
    );
  }
  void fetchImage() async
  {
counter++;
var url  = Uri.parse("https://jsonplaceholder.typicode.com/photos/$counter");
var response  = await get(url);
var body  = response.body;
var parseMap = jsonDecode(body);
var imageModel  = ImageResponseModel.fromMap(parseMap);
setState(() {
  imagelist.add(imageModel);
});




  }
}
