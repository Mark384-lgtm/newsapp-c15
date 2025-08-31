import 'package:flutter/material.dart';
import 'package:news_c15/core/remote/network/ApiManager.dart';
import 'package:news_c15/model/SourcesResponse/Source.dart';

import 'ArticleItem.dart';

class ArticlesWidget extends StatelessWidget {
  Source source;
  ArticlesWidget(this.source);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(source.id!),
        builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error!.toString()),);
            }
            var articlesResponse = snapshot.data;
            if(articlesResponse?.status=="error"){
              return Center(child: Text(articlesResponse?.message??""),);
            }
            var articles = articlesResponse?.articles??[];
            return ListView.separated(
                itemBuilder: (context, index) =>ArticleItem(articles[index]) ,
                separatorBuilder: (context, index) => SizedBox(height: 16,),
                itemCount: articles.length);

        },);
  }
}
