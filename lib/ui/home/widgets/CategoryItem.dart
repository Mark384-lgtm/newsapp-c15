import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_c15/core/resources/AssetsManager.dart';
import 'package:news_c15/core/resources/StringsManager.dart';

import '../../../model/CategoryModel.dart';

class CategoryItem extends StatelessWidget {
  int index;
  CategoryModel categoryModel;
  void Function() onClick;
  CategoryItem({required this.index,required this.categoryModel,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: index.isEven?TextDirection.ltr:TextDirection.rtl,
      child: Container(
        height: 198.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Theme.of(context).colorScheme.primary
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(categoryModel.imagePath,height: 198.h,
              width: 140.w,
              fit: BoxFit.fill,),
            SizedBox(width: 5.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [
                Text(categoryModel.title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary
                ),),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    padding: REdgeInsetsDirectional.only(
                      start:16,
                      top: 9,
                      bottom: 9
                    )
                  ),
                    onPressed: (){
                    onClick();
                    },
                    child: Row(
                      children: [
                        Text(StringsManager.viewAll,style: Theme.of(context).textTheme.headlineMedium,),
                        SizedBox(width: 10,),
                        CircleAvatar(
                          radius: 27.r,
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          child: SvgPicture.asset(
                            AssetsManager.arrow,
                            height: 24.h,
                            width: 24.w,
                            matchTextDirection: true,
                            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                          ),
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
