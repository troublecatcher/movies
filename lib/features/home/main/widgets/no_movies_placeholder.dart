import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/features/home/main/widgets/new_movie_button.dart';

class NoMoviesPlaceholder extends StatelessWidget {
  const NoMoviesPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 39.h),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/home.svg'),
                SizedBox(height: 60.h),
                Text(
                  'There\'s no info',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: CupertinoTheme.of(context).primaryColor),
                ),
                SizedBox(height: 8.h),
                const Text('Add the first movie you watched'),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 32.h),
            child: const NewMovieButton(),
          ),
        )
      ],
    );
  }
}
