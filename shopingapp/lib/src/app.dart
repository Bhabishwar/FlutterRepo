import 'dart:convert';

import  'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shopingapp/models/image.dart';
import 'package:shopingapp/wedgets/imagewidget_list.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int counter  =0;
  List<imageModel> imageList =[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is My App"),
          backgroundColor: Colors.green,


        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            fetchImageData();
            print("counter is $counter");
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),

        body: imageWidet(imageList),
      ),

    );
  }

  void fetchImageData() async {

    counter++;
    var url  = Uri.parse("https://jsonplaceholder.typicode.com/photos/$counter");
    var response  = await get(url);
    var body  = response.body;
    var parseMap = jsonDecode(body);
    var imgModel  = imageModel.fromMap(parseMap);
    setState(() {
      imageList.add(imgModel);
    });




  }
}
