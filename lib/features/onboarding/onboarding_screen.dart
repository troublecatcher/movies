import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/theme/const.dart';
import 'package:movies/router/router.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Padding(
        padding: pagePadding,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 65.h),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/onboarding.svg'),
                    SizedBox(height: 79.h),
                    Text(
                      'Welcome to our app!',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    const Text(
                      'Keep track of the movies you watch',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 32.h),
                      child: CupertinoButton.filled(
                        child: const Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => context.router
                            .replace(const OnboardingStartRoute()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
