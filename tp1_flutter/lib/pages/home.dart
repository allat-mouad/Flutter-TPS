import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:tp1_flutter/widgets/app_drawer.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            AnimSearchBar(
                width: 200,
                textController: textController,
                onSuffixTap: () {
                  setState(() {
                    textController.clear();
                  });
                },

            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                Navigator.pushNamed(context, "/${value}");
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("Contacts"),
                    value: "contacts",
                  ),
                  PopupMenuItem(
                    child: Text("News"),
                    value: "news",
                  ),
                  PopupMenuItem(
                    child: Text("Github users"),
                    value: "github_users",
                  ),
                  PopupMenuItem(
                    child: Text("Covid News"),
                    value: "covid",
                  )
                ];
              },
            )
          ],
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/contacts");
            },
            child: Text("Contacts"),
          ),
        ));
  }
}
