import 'package:flutter/material.dart';
import 'package:tp1_flutter/pages/contacts.dart';
import 'package:tp1_flutter/pages/github_users.dart';
import 'package:tp1_flutter/pages/home.dart';
import 'package:tp1_flutter/pages/news.dart';
import 'package:tp1_flutter/pages/covid.dart';

import 'news-api/home.dart';

void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          //bodyText1: TextStyle(color: Colors.grey)
        )
      ),
      routes: {
        "/":(context)=>Home(),
        "/contacts":(context)=>Contacts(),
        "/github_users":(context)=>GitHubUsers(),
        "/news":(context)=>News(),
        "/covid":(context)=>Covid(),
      },

    );
  }

}