import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/theme/const.dart';
import 'package:movies/shared/widgets/custom_button.dart';
import 'package:movies/shared/widgets/custom_text_field.dart';
import 'package:movies/shared/widgets/custom_widget_with_title.dart';
import 'package:movies/shared/selector/selector_cubit.dart';
import 'package:movies/shared/selector/option_widget.dart';
import 'package:movies/main.dart';
import 'package:movies/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class OnboardingStartScreen extends StatefulWidget {
  const OnboardingStartScreen({super.key});

  @override
  State<OnboardingStartScreen> createState() => _OnboardingStartScreenState();
}

class _OnboardingStartScreenState extends State<OnboardingStartScreen> {
  late TextEditingController typeController;

  @override
  void initState() {
    super.initState();
    typeController = TextEditingController();
  }

  @override
  void dispose() {
    typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectorCubit(),
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const CupertinoSliverNavigationBar(
                backgroundColor: Colors.transparent,
                largeTitle: Text('Let\'s start'),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: pagePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      CustomWidgetWithTitle(
                          title: 'What type of movies do you usually watch?',
                          child: CustomTextField(
                            onChanged: (_) => setState(() {}),
                            controller: typeController,
                          )),
                      SizedBox(height: 12.h),
                      const Text('How many movies do you watch per month?'),
                      SizedBox(height: 8.h),
                      const Column(
                        children: [
                          OptionWidget(title: '1-5', index: 0),
                          OptionWidget(title: '6-10', index: 1),
                          OptionWidget(title: 'More than 10', index: 2),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      BlocBuilder<SelectorCubit, int?>(
                        builder: (context, selectorState) {
                          final activeCondition = isFormFull(selectorState);
                          return Padding(
                            padding: EdgeInsets.only(bottom: 32.h),
                            child: CustomButton(
                                title: 'Continue',
                                onPressed: () {
                                  locator<SharedPreferences>()
                                      .setBool('isFirstTime', false);
                                  context.router.replace(const HomeRoute());
                                },
                                activeConditon: activeCondition),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isFormFull(int? selectorState) {
    return typeController.text != '' && selectorState != null;
  }
}
