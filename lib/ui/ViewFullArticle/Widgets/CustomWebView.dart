import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatefulWidget {
  String? Function() geturl;

  CustomWebView(this.geturl);

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  late WebViewController _controller;
  late bool isloading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isloading=true;
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            isloading = true;
          });
        },
        onPageFinished: (url) {
          setState(() {
            isloading = false;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.geturl() ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : WebViewWidget(controller: _controller);
  }
}
