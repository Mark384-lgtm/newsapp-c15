import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_c15/core/resources/AssetsManager.dart';
import 'package:news_c15/core/resources/ColorManager.dart';
import 'package:news_c15/core/resources/StringsManager.dart';

class CustomDrawer extends StatelessWidget {
  void Function() goToHome;
  CustomDrawer(this.goToHome);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.lightPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
        children: [
          Container(
            height: 166.h,
            width: double.infinity,
            alignment: Alignment.center,
            color: ColorManager.lightSecondaryColor,
            child: Text(
              StringsManager.appTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      goToHome();
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AssetsManager.home,
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          StringsManager.goToHome,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: ColorManager.lightSecondaryColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
