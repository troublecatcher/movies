import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:movies/features/settings/settings_item.dart';
import 'package:movies/router/router.dart';
import 'package:movies/shared/widgets/custom_button.dart';
import 'package:movies/shared/widgets/custom_container.dart';
import 'package:movies/theme/const.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Settings'),
            previousPageTitle: 'Back',
            border: null,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: pagePadding,
              child: Column(
                children: [
                  CustomContainer(
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        SvgPicture.asset('assets/images/settings.svg'),
                        SizedBox(height: 31.h),
                        Text(
                          'Your opinion is important!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        const Text('We need your feedback to get better'),
                        SizedBox(height: 31.h),
                        CustomButton(
                          title: 'Rate app',
                          onPressed: () async {
                            final InAppReview inAppReview =
                                InAppReview.instance;

                            if (await inAppReview.isAvailable()) {
                              inAppReview.requestReview();
                            }
                          },
                          activeConditon: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SettingsItem(
                    title: 'Terms of use',
                    iconAssetPath: 'assets/icons/terms_of_use.svg',
                    onPressed: () =>
                        context.router.push(const TermsOfUseRoute()),
                  ),
                  SizedBox(height: 12.h),
                  SettingsItem(
                    title: 'Privacy Policy',
                    iconAssetPath: 'assets/icons/privacy_policy.svg',
                    onPressed: () =>
                        context.router.push(const PrivacyPolicyRoute()),
                  ),
                  SizedBox(height: 12.h),
                  SettingsItem(
                    title: 'Support page',
                    iconAssetPath: 'assets/icons/support_page.svg',
                    onPressed: () =>
                        context.router.push(const SupprotRouteRoute()),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
