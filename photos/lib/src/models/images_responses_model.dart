// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class ImageResponseModel {
  int? id;
  String? title;
  String? url;

  ImageResponseModel(this.id, this.title, this.url);

  ImageResponseModel.fromMap(Map<String, dynamic>parseMap) {
    id = parseMap["id"];
    title = parseMap["title"];
    url = parseMap["url"];

  }
}
