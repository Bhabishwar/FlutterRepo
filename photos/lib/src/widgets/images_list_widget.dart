import 'package:flutter/material.dart';
import 'package:photos/src/models/images_responses_model.dart';
class ImageListWidget extends StatelessWidget {
  final List<ImageResponseModel> imageslist;
  ImageListWidget(this.imageslist);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return buildEachItem(imageslist[index]);
    },
      itemCount: imageslist.length,
    );
  }

    Widget buildEachItem(ImageResponseModel imageResponseModel){
      return Container(child: Column(
        children: [
          Image.network(imageResponseModel.url!),
          Padding(padding: const EdgeInsets.only(top: 8, bottom: 8),
            child:  Text(imageResponseModel.title!, style: TextStyle(fontSize: 13),),

          ),


        ],
      ),
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(

              color: Colors.blue

          ),




        ),
      );
    }
  }


