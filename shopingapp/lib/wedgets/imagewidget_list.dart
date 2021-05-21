import 'package:flutter/material.dart';
import 'package:shopingapp/models/image.dart';

class imageWidet extends StatelessWidget {
  final List<imageModel> imgList;

  imageWidet(this.imgList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return buildEachImage(imgList[index]);
      },
      itemCount: imgList.length,
    );
  }

  Widget buildEachImage(imageModel imgList) {
    return Container(
      child: Column(
        children: [
          Image.network(imgList.url!),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Text(
              imgList.title!,
              style: TextStyle(fontSize: 13),
            ),


          ),

        ],

      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(

          color: Colors.blue
        )


      ),

    );
  }
}
