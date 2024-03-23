import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/theme/const.dart';
import 'package:movies/shared/widgets/custom_container.dart';
import 'package:movies/shared/selector/selector_cubit.dart';

class OptionWidget extends StatelessWidget {
  final String title;
  final int index;
  final String? svgIconAssetPath;

  const OptionWidget({
    super.key,
    required this.index,
    required this.title,
    this.svgIconAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.read<SelectorCubit>().set(index),
          child: Row(children: [
            Expanded(
              child: BlocBuilder<SelectorCubit, int?>(
                builder: (context, state) {
                  Color color;
                  final selected = context.read<SelectorCubit>().state == index;
                  if (selected) {
                    color = CupertinoTheme.of(context).primaryColor;
                  } else {
                    color = Colors.white;
                  }
                  return OptionWidgetChild(
                      selected: selected,
                      svgIconAssetPath: svgIconAssetPath,
                      color: color,
                      title: title);
                },
              ),
            ),
          ])),
    );
  }
}

class OptionWidgetChild extends StatelessWidget {
  const OptionWidgetChild({
    super.key,
    required this.selected,
    required this.svgIconAssetPath,
    required this.color,
    required this.title,
  });

  final bool selected;
  final String? svgIconAssetPath;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      border: selected
          ? Border.all(color: CupertinoTheme.of(context).primaryColor)
          : Border.all(color: surface2Color),
      child: Builder(
        builder: (context) {
          if (svgIconAssetPath != null) {
            return Row(
              children: [
                SvgPicture.asset(
                  svgIconAssetPath!,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                SizedBox(width: 7.w),
                Text(
                  title,
                  style: TextStyle(color: color),
                ),
              ],
            );
          } else {
            return Text(
              title,
              style: TextStyle(color: color),
            );
          }
        },
      ),
    );
  }
}
