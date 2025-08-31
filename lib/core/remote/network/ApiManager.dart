import 'package:dio/dio.dart';
import 'package:news_c15/core/resources/AppConstants.dart';
import 'package:news_c15/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:news_c15/model/SourcesResponse/SourcesResponse.dart';

class ApiManager{
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org"
    )
  );

  static Future<SourcesResponse?> getSources(String category)async{
    print("selected category is ${category}");
    try{
      var response = await dio.get("/v2/top-headlines/sources",queryParameters: {
        "apiKey":apiKey,
        "category":category
      });
      var sourceResponse = SourcesResponse.fromJson(response.data);
      return sourceResponse;
    }catch(error){
      print(error);
    }
  }

  static Future<ArticlesResponse?> getArticles(String source , String? q)async{
   try{
     //?apiKey=d3e16e322c2e4c00b4b4f4967c290a7f
     if(q=='')q=null;
     print ("passed q = ${q}");
     var response = await dio.get("/v2/everything",queryParameters: {
       "sources":source,
       "apiKey":apiKey,
       "q":q
     });
     ArticlesResponse articlesResponse = ArticlesResponse.fromJson(response.data);
     return articlesResponse;
   }catch(e){
     print(e);
   }
  }
}