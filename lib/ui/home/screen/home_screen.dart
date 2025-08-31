import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c15/core/remote/network/ApiManager.dart';
import 'package:news_c15/core/resources/AssetsManager.dart';
import 'package:news_c15/core/resources/StringsManager.dart';
import 'package:news_c15/model/CategoryModel.dart';
import 'package:news_c15/ui/home/widgets/CategoryDetailsWidget.dart';
import 'package:news_c15/ui/home/widgets/CustomDrawer.dart';
import 'package:news_c15/ui/home/widgets/HomeWidget.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? categoryModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager.getSources("sports");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel==null?StringsManager.home:categoryModel!.title),
      ),
      drawer:CustomDrawer((){
        Navigator.pop(context);
        setState(() {
          categoryModel=null;
        });
      }),
      body: categoryModel==null
          ?HomeWidget(onCategoryClicked)
          : CategoryDetailsWidget(categoryModel!),
    );
  }

  onCategoryClicked(CategoryModel newCategoryModel){
      categoryModel = newCategoryModel;
      setState(() {

      });
  }
}
