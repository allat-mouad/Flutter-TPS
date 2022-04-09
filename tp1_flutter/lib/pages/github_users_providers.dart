import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tp1_flutter/providers/github_users_state.dart';

class GitHubUsersProvider extends StatelessWidget {

  TextEditingController textEditingController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Users"),
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
                     Provider.of<GitHubUsersState>(context,listen: false).searchGithubUser(textEditingController.text);
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            Expanded(
            child: Consumer<GitHubUsersState>(

            builder:(context,githubState,child) {
              print("***** Consumer *****");

              return ListView.builder(

                itemCount: githubState.users == null ||
                    githubState.users["items"] == null ? 0 : githubState
                    .users["items"].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          githubState.users["items"][index]["avatar_url"]),
                    ),
                    title: Text(githubState.users["items"][index]["login"]),
                  );
                },
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
