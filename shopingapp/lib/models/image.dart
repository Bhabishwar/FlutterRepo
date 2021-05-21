// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class imageModel {
  int? id;
  String? title;
  String? url;

  imageModel(this.id, this.title, this.url);

  imageModel.fromMap(Map<String, dynamic>parseMap) {
    id = parseMap["id"];
    title = parseMap["title"];
    url = parseMap["url"];

  }
}
