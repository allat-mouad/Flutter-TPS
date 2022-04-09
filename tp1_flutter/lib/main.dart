import 'package:flutter/material.dart';
import 'package:tp1_flutter/pages/contacts.dart';
import 'package:tp1_flutter/pages/github_users.dart';
import 'package:tp1_flutter/pages/github_users_providers.dart';
import 'package:tp1_flutter/pages/home.dart';
import 'package:tp1_flutter/pages/news.dart';
import 'package:tp1_flutter/pages/covid.dart';
import 'package:tp1_flutter/pages/contacts_providers.dart';
import 'package:tp1_flutter/pages/news_providers.dart';
import 'package:tp1_flutter/providers/contacts_state.dart';
import 'package:tp1_flutter/providers/news_state.dart';
import 'package:tp1_flutter/providers/github_users_state.dart';
import 'package:provider/provider.dart';


import 'news-api/home.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context)=>ContactState()),
        ChangeNotifierProvider(create: (context)=>NewsState()),
        ChangeNotifierProvider(create: (context)=>GitHubUsersState()),

      ],
      child: MaterialApp(
        routes: {
          "/":(context)=>Home(),
          "/contacts":(context)=>ContactProvider(),
          "/news":(context)=>News(),
          "/github_users":(context)=>GitHubUsersProvider(),


        },
      ),
    );
  }
}
