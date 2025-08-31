import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c15/core/resources/StringsManager.dart';
import 'package:news_c15/model/CategoryModel.dart';
import 'package:news_c15/ui/home/widgets/CategoryItem.dart';

class HomeWidget extends StatelessWidget {
  void Function(CategoryModel categoryModel) onCategoryClicked;
  HomeWidget(this.onCategoryClicked);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        children: [
          Text(StringsManager.welcome,style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: 16.h,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => CategoryItem(
                  onClick: (){
                    onCategoryClicked(CategoryModel.categories[index]);
                  },
                  index: index,
                  categoryModel:CategoryModel.categories[index] ,
                ),
                separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                itemCount: CategoryModel.categories.length
            ),
          )
        ],
      ),
    );
  }
}
