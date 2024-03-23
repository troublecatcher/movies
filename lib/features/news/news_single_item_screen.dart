import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/news/news.dart';
import 'package:movies/theme/const.dart';

@RoutePage()
class NewsSingleItemScreen extends StatelessWidget {
  final News news;
  const NewsSingleItemScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: const Text(''),
            previousPageTitle: 'Back',
            border: null,
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: surface2Color,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                'Today',
                style: TextStyle(
                  color: CupertinoTheme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: pagePadding,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Image.network(news.imageLink),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    news.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(news.content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
