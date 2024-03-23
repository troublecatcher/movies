import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/theme/const.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Border? border;

  const CustomContainer({super.key, required this.child, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: surface2Color,
        borderRadius: borderRadius,
        border: border,
      ),
      child: child,
    );
  }
}
