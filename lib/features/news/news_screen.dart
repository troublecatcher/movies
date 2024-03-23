import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/news/news.dart';
import 'package:movies/router/router.dart';
import 'package:movies/shared/widgets/custom_container.dart';
import 'package:movies/theme/const.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('News'),
            previousPageTitle: 'Back',
            border: null,
          ),
          SliverList.separated(
            itemCount: News.newsList.length,
            itemBuilder: (context, index) {
              final news = News.newsList[index];
              return Padding(
                padding: pagePadding,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () =>
                      context.router.push(NewsSingleItemRoute(news: news)),
                  child: CustomContainer(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: borderRadius,
                          child: Image.network(
                            news.imageLink,
                            width: 98.r,
                            height: 98.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                news.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 22.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: surface1Color,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                'Today',
                                style: TextStyle(
                                  color:
                                      CupertinoTheme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 32.h)),
        ],
      ),
    );
  }
}
