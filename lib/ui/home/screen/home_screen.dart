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
  late bool openSearchField;
  late TextEditingController search_controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openSearchField = false;
    search_controller = TextEditingController();
    ApiManager.getSources("sports");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    search_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !openSearchField
          ? AppBar(
              title: Text(categoryModel == null
                  ? StringsManager.home
                  : categoryModel!.title),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        print("change openSearchField");
                        openSearchField = true;
                      });
                    },
                    icon: const Icon(Icons.search))
              ],
            )
          : AppBar(
              titleSpacing: 0,
              title: Padding(
                padding: REdgeInsets.all(16.sp),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: Icon(Icons.search),
                      ),
                      hintText: "Search",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            openSearchField = false;
                          });
                        },
                        icon: Icon(Icons.close),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  controller: search_controller,
                ),
              ),
              centerTitle: true,
            ),
      drawer: !openSearchField
          ? CustomDrawer(() {
              Navigator.pop(context);
              setState(() {
                categoryModel = null;
              });
            })
          : null,
      body: categoryModel == null
          ? HomeWidget(onCategoryClicked)
          : CategoryDetailsWidget(
              categoryModel!,
              getSearchKeyword: getSearchKeyword,
            ),
    );
  }

  onCategoryClicked(CategoryModel newCategoryModel) {
    categoryModel = newCategoryModel;
    setState(() {});
  }

  String? getSearchKeyword() {
    return search_controller.text ?? null;
  }
}
