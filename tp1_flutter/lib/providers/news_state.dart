import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class NewsState extends ChangeNotifier{
  var articles=null;

  void searchNews(newskey){
    String url="http://newsapi.org/v2/everything?q=${newskey}&pageSize=10&page=1&apiKey=f580831459b64b5280f67819e5700cce";
    http.get(Uri.parse(url))
        .then((response) {
        articles= json.decode(response.body);
    }).catchError((onError){
      print(onError);
    });
    notifyListeners();

  }

}