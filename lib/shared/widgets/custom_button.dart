import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool activeConditon;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.activeConditon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoButton.filled(
            disabledColor:
                CupertinoTheme.of(context).primaryColor.withOpacity(0.3),
            onPressed: activeConditon ? onPressed : null,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white.withOpacity(activeConditon ? 1 : 0.3)),
            ),
          ),
        ),
      ],
    );
  }
}
