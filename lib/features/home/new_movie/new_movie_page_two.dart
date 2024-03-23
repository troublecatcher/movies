import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/data/movie.dart';
import 'package:movies/features/home/main/movie_list_cubit.dart';
import 'package:movies/features/home/new_movie/movie_cubit.dart';
import 'package:movies/shared/selector/selector_cubit.dart';
import 'package:movies/shared/widgets/custom_button.dart';
import 'package:movies/shared/widgets/custom_container.dart';
import 'package:movies/shared/widgets/custom_text_field.dart';
import 'package:movies/shared/widgets/custom_widget_with_title.dart';

class NewMoviePageTwo extends StatefulWidget {
  final Movie? movie;
  final int? index;
  const NewMoviePageTwo({
    super.key,
    this.movie,
    this.index,
  });

  @override
  State<NewMoviePageTwo> createState() => _NewMoviePageTwoState();
}

class _NewMoviePageTwoState extends State<NewMoviePageTwo> {
  late TextEditingController commentController;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();
    if (widget.movie != null) {
      commentController.text = widget.movie!.comment!;
      context.read<SelectorCubit>().set(widget.movie!.rate!);
    }
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomWidgetWithTitle(
            title: 'Write a comment about movie',
            child: CustomTextField(
              lines: 4,
              controller: commentController,
              onChanged: (_) => setState(() {}),
            ),
          ),
          SizedBox(height: 12.h),
          BlocBuilder<SelectorCubit, int?>(
            builder: (context, state) {
              return CustomWidgetWithTitle(
                title: 'How would you rate the movie?',
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                child: CustomContainer(
                  child: Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () =>
                              context.read<SelectorCubit>().set(index),
                          child: Builder(
                            builder: (context) {
                              if (state != null && state >= index) {
                                return SvgPicture.asset(
                                  'assets/icons/star_filled.svg',
                                  width: 32.r,
                                  height: 32.r,
                                  colorFilter: ColorFilter.mode(
                                      CupertinoTheme.of(context).primaryColor,
                                      BlendMode.srcIn),
                                );
                              } else {
                                return SvgPicture.asset(
                                  'assets/icons/star_unfilled.svg',
                                  width: 32.r,
                                  height: 32.r,
                                  colorFilter: ColorFilter.mode(
                                      CupertinoTheme.of(context).primaryColor,
                                      BlendMode.srcIn),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          BlocBuilder<SelectorCubit, int?>(
            builder: (context, selectorState) {
              final activeCondition = isFormFull(selectorState);
              return CustomButton(
                  title: 'Done',
                  onPressed: () {
                    if (widget.movie == null) {
                      final currentMovie = context.read<MovieCubit>().state!;
                      final updatedMovie = currentMovie.copyWith(
                        comment: commentController.text,
                        rate: selectorState!,
                      );
                      context.read<MovieListCubit>().create(updatedMovie);
                    } else {
                      final notFullMovie = context.read<MovieCubit>().state!;
                      final fullMovie = notFullMovie.copyWith(
                        comment: commentController.text,
                        rate: selectorState!,
                      );
                      context
                          .read<MovieListCubit>()
                          .update(widget.index!, fullMovie);
                    }
                    context.router.popForced();
                  },
                  activeConditon: activeCondition);
            },
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  bool isFormFull(int? selectorState) {
    return commentController.text != '' && selectorState != null;
  }
}
