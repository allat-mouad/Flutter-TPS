import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String postUrl;
  ArticleView({required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  late WebViewController _controller;
  _back() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
  }
  _forward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.postUrl}");
    return Scaffold(
      appBar: AppBar(
        title:
            Text(
              "Flutter News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
        actions: <Widget>[
          IconButton(
            onPressed: _back,
            icon: Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: _forward,
            icon: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(width: 10),
        ],



      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl:  widget.postUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _controller =webViewController;
          },
        ),
      ),
    );
  }
}