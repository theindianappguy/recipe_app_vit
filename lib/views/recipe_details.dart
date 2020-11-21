import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeDetails extends StatefulWidget {
  final String recipeDetailsUrl;
  RecipeDetails(this.recipeDetailsUrl);

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  var finalUrl;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    if (widget.recipeDetailsUrl.contains("http://")) {
      finalUrl = widget.recipeDetailsUrl.replaceAll("http://", "https://");
    } else {
      finalUrl = widget.recipeDetailsUrl;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipe Details"),
        ),
        body: WebView(
          initialUrl: finalUrl,
          onWebViewCreated: (WebViewController webViewController) {
            setState(() {
              _controller.complete(webViewController);
            });
          },
        ));
  }
}
