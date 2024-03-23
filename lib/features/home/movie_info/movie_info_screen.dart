import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/data/movie.dart';
import 'package:movies/features/home/main/movie_list_cubit.dart';
import 'package:movies/router/router.dart';
import 'package:movies/shared/selector/option_widget.dart';
import 'package:movies/shared/widgets/custom_button.dart';
import 'package:movies/shared/widgets/custom_container.dart';
import 'package:movies/shared/widgets/custom_widget_with_title.dart';
import 'package:movies/theme/const.dart';

@RoutePage()
class MovieInfoScreen extends StatefulWidget {
  final int index;
  const MovieInfoScreen({super.key, required this.index});

  @override
  State<MovieInfoScreen> createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> {
  late bool deleting;

  @override
  void initState() {
    super.initState();
    deleting = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListCubit, List<Movie>>(
      builder: (context, state) {
        if (deleting) {
          return const CupertinoActivityIndicator();
        } else {
          try {
            final movie = state[widget.index];
            return CupertinoPageScaffold(
              child: CustomScrollView(
                slivers: [
                  CupertinoSliverNavigationBar(
                    largeTitle: const Text('Movie info'),
                    trailing: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => context.router.push(
                            NewMovieRoute(movie: movie, index: widget.index)),
                        child: const Text('Edit')),
                    border: null,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: pagePadding,
                      child: Column(
                        children: [
                          CustomContainer(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Movie name',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        movie.title,
                                        style: TextStyle(
                                            color: CupertinoTheme.of(context)
                                                .primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        'Directed by',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        movie.director,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          CustomWidgetWithTitle(
                            title: 'What did you think of the movie',
                            child: OptionWidgetChild(
                              selected: true,
                              svgIconAssetPath: movie.emotion.assetPath,
                              color: CupertinoTheme.of(context).primaryColor,
                              title: movie.emotion.description,
                            ),
                          ),
                          CustomWidgetWithTitle(
                            title: 'Movie rate',
                            child: CustomContainer(
                              child: Row(
                                children: List.generate(
                                  5,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(right: 12.w),
                                    child: Builder(
                                      builder: (context) {
                                        if (movie.rate != null &&
                                            movie.rate! >= index) {
                                          return SvgPicture.asset(
                                            'assets/icons/star_filled.svg',
                                            width: 32.r,
                                            height: 32.r,
                                            colorFilter: ColorFilter.mode(
                                                CupertinoTheme.of(context)
                                                    .primaryColor,
                                                BlendMode.srcIn),
                                          );
                                        } else {
                                          return SvgPicture.asset(
                                            'assets/icons/star_unfilled.svg',
                                            width: 32.r,
                                            height: 32.r,
                                            colorFilter: ColorFilter.mode(
                                                CupertinoTheme.of(context)
                                                    .primaryColor,
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
                          CustomWidgetWithTitle(
                            title: 'Comment',
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomContainer(
                                    child: Text(movie.comment!),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          CustomButton(
                              title: 'Delete',
                              onPressed: () => showCupertinoDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                      title: const Text('Are you sure?'),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: const Text('Yes'),
                                          onPressed: () {
                                            deleting = true;
                                            context
                                                .read<MovieListCubit>()
                                                .delete(widget.index);
                                            context.router
                                              ..popForced()
                                              ..popForced();
                                          },
                                        ),
                                        CupertinoDialogAction(
                                          isDefaultAction: true,
                                          child: const Text('No'),
                                          onPressed: () =>
                                              context.router.popForced(),
                                        ),
                                      ],
                                    ),
                                  ),
                              activeConditon: true),
                          SizedBox(height: 32.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } catch (e) {
            return const CupertinoActivityIndicator();
          }
        }
      },
    );
  }
}
