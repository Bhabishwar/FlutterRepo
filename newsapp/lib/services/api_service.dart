import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/aticle_model.dart';

class ApiService {

  final endPointUrl = Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2021-04-16&sortBy=publishedAt&apiKey=59b66baf7f6b4cdfba9160c9d70ddc44");


  Future<List<Articles>> getArticles() async {
    final res = await get(endPointUrl);



    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];


      List<dynamic> articles =
          body.map((dynamic news) => Articles.fromJson(news)).toList();
      print(articles);

      return articles;
    } else {
      throw ("can't get artilce");
    }
  }
}
