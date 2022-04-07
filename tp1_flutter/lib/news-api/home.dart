import 'package:flutter/material.dart';
class HomeNews extends StatefulWidget {
  const HomeNews({Key? key}) : super(key: key);

  @override
  State<HomeNews> createState() => _HomeState();
}

class _HomeState extends State<HomeNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("News")
          ],
        ),
        elevation: 0.0,
      ),
    );
  }
}
