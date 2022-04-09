import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tp1_flutter/providers/news_state.dart';

class NewsProviders extends StatelessWidget {


  TextEditingController textEditingController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("***** build method *****");

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
                Expanded(
                    child: TextFormField(
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
                    Provider.of<NewsState>(context,listen: false).searchNews(textEditingController.text);
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            Expanded(
            child: Consumer<NewsState>(
            builder:(context,newsStat,child){
                print("***** Consumer *****");
                return ListView.builder(

                itemCount:newsStat.articles==null||newsStat.articles['articles']==null?0: newsStat.articles['articles'].length,
                itemBuilder: (context, index) {
                return ListTile(
                leading: GFAvatar(
                backgroundImage: NetworkImage(newsStat.articles['articles'][index]["urlToImage"]),
                shape: GFAvatarShape.square
                ),
                title: Text(newsStat.articles['articles'][index]['title']),
                );
                }
                );
                }
            )
            )
          ],
        ),
      ),
    );
  }
}
