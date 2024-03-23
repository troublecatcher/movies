import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/shared/widgets/custom_container.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String iconAssetPath;
  final Function() onPressed;

  const SettingsItem({
    super.key,
    required this.title,
    required this.iconAssetPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: CustomContainer(
        child: CupertinoListTile(
          padding: EdgeInsets.zero,
          leading: SvgPicture.asset(iconAssetPath),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: CupertinoTheme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
