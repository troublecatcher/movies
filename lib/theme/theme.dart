import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/theme/const.dart';

final theme = CupertinoThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: surface1Color,
  barBackgroundColor: surface1Color,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 16.sp,
        fontWeight: FontWeight.w400),
    navActionTextStyle: TextStyle(
      color: primaryColor,
      fontSize: 16.sp,
      inherit: false,
    ),
  ),
);
