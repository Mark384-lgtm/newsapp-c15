import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c15/core/remote/network/ApiManager.dart';
import 'package:news_c15/core/resources/AppConstants.dart';
import 'package:news_c15/model/CategoryModel.dart';
import 'package:news_c15/model/SourcesResponse/Source.dart';
import 'package:news_c15/ui/home/widgets/ArticlesWidget.dart';

class CategoryDetailsWidget extends StatelessWidget {
  CategoryModel categoryModel;
  CategoryDetailsWidget(this.categoryModel,{required this.getSearchKeyword});
  String?Function() getSearchKeyword;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(categoryModel.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          if(snapshot.data!.status=="error"){
            return Center(child: Text(snapshot.data!.message!),);
          }
          List<Source> sources = snapshot.data?.sources??[];
          return DefaultTabController(
            length: sources.length,
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                children: [
                  TabBar(
                      isScrollable: true,
                      tabs: sources.map((source) => Tab(text: source.name,)).toList()
                  ),
                  SizedBox(height: 16.h,),
                  Expanded(
                    child: TabBarView(
                      children: sources.map((source) => ArticlesWidget(source,getSearchKeyword: getSearchKeyword ,)).toList(),
                    ),
                  )
                ],
              ),
            ),
          );
        },
    );
  }
}
