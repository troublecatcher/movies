import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWidgetWithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  final TextStyle? titleTextStyle;

  const CustomWidgetWithTitle({
    super.key,
    required this.title,
    required this.child,
    this.titleTextStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleTextStyle,
        ),
        SizedBox(height: 8.h),
        child,
        SizedBox(height: 16.h),
      ],
    );
  }
}
