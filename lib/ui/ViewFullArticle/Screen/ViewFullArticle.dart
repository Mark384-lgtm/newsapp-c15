import 'package:flutter/material.dart';
import 'package:news_c15/ui/ViewFullArticle/Widgets/CustomWebView.dart';

class ViewFullArticle extends StatelessWidget {

  late String ? Function() geturl;
  @override
  Widget build(BuildContext context) {
    geturl=ModalRoute.of(context)!.settings.arguments as String? Function() ;
    return Scaffold(
      body:CustomWebView(geturl),
    );
  }
}


