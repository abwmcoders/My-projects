import 'dart:convert';

import 'package:sports_news/model/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

 Future<void> getnews() async {
   String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&"
       "apiKey=b68e68a90afd4125a8edba60c536822c";

   var response = await http.get(Uri.parse(url));
   var jsonData = jsonDecode(response.body);
   if(jsonData["status"] == "ok") {
     jsonData["article"].forEach((element) {
       if(element["urlToImage"] != null && element["description"] != null){
         ArticleModel articleModel = ArticleModel(
           title: element["title"],
           author: element["author"],
           description: element["description"],
           url: element["url"],
           urlImage: element["urlToImage"],
           // publishedAt: element["publishedAt"],
           content: element["content"],
         );

         news.add(articleModel);
       }
     });
   } else{
     throw Exception("Unable to fetch data");
   }
 }
}