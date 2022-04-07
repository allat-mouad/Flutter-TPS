import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:http/http.dart' as http;

class Covid extends StatefulWidget {
  @override
  State<Covid> createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  var results=null;
  TextEditingController textEditingController=new TextEditingController();

  void searchCovid(countrykey){
    String url="https://corona.lmao.ninja/v3/covid-19/countries/${countrykey}?strict=true";
   http.get(Uri.parse(url))
       .then((response) {
     setState(() {
       results= json.decode(response.body);
     });
   }).catchError((onError){
      print(onError);
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid19"),
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
                      searchCovid(textEditingController.text);
                    });
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(

                itemCount:results==null||results['cases']==null?0:1,
                itemBuilder: (context,index) {
                return ListTile(
                  leading: Text("total cases  : ${results['cases']}"),
                    subtitle: Text("total deaths  : ${results['deaths']}\n"
                        "today Recovered  : ${results['todayRecovered']}\n"
                        "active  : ${results['active']}"),
                  title: Text("recovered  : ${results['recovered']}")
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
