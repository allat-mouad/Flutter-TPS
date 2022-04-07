import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  var articles=null;
  TextEditingController textEditingController=new TextEditingController();

  void searchNews(newskey){
    String url="http://newsapi.org/v2/everything?q=${newskey}&pageSize=10&page=1&apiKey=f580831459b64b5280f67819e5700cce";
   http.get(Uri.parse(url))
       .then((response) {
     setState(() {
       articles= json.decode(response.body);
     });
   }).catchError((onError){
      print(onError);
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("news"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                )),
                IconButton(
                  onPressed: () {
                    setState(() {
                      searchNews(textEditingController.text);
                    });
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(

                itemCount:articles==null||articles['articles']==null?0: articles['articles'].length,
                itemBuilder: (context, index) {
                return ListTile(
                  leading: GFAvatar(
                    backgroundImage: NetworkImage(articles['articles'][index]["urlToImage"]),
                      shape: GFAvatarShape.square
                  ),
                    title: Text(articles['articles'][index]['title']),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
