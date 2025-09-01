import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c15/core/resources/ColorManager.dart';
import 'package:news_c15/core/resources/RoutesManager.dart';
import 'package:news_c15/model/ArticlesResponse/Article.dart';
import 'package:timeago/timeago.dart' as timeago;

main() {
  final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));

  print(timeago.format(fifteenAgo)); // 15 minutes ago
  print(timeago.format(fifteenAgo, locale: 'en_short')); // 15m
  print(timeago.format(fifteenAgo, locale: 'es')); // hace 15 minutos
}

class ArticleItem extends StatelessWidget {
  Article article;

  ArticleItem(this.article);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: REdgeInsets.only(bottom: 16),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 413.h,
                    width: 361.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: ColorManager.lightPrimaryColor),
                    padding: REdgeInsets.all(6),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: CachedNetworkImage(
                            height: 220.h,
                            fit: BoxFit.fitHeight,
                            imageUrl: article.urlToImage ?? "",
                            placeholder: (context, url) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            article.description ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 16.sp,
                                    color: ColorManager.lightSecondaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: FloatingActionButton(
                                backgroundColor:
                                    ColorManager.lightSecondaryColor,
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      RoutesManager.ViewFullArticle,
                                      arguments: geturl);
                                },
                                child: Text(
                                  "View Full Article",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 16.sp,
                                          color:
                                              ColorManager.lightPrimaryColor),
                                ),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  height: 220.h,
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(
                      Icons.error,
                      size: 60.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              article.title ?? "",
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 16.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "By : ${article.author}",
                  style: Theme.of(context).textTheme.titleSmall,
                )),
                Text(
                  timeago.format(DateTime.parse(article.publishedAt ?? "")),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String? geturl() {
    return article.url;
  }
}
