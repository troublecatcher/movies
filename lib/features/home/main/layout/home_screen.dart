import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/features/home/main/movie_list_cubit.dart';
import 'package:movies/features/home/main/widgets/new_movie_button.dart';
import 'package:movies/features/home/main/widgets/no_movies_placeholder.dart';
import 'package:movies/data/movie.dart';
import 'package:movies/router/router.dart';
import 'package:movies/shared/widgets/custom_container.dart';
import 'package:movies/theme/const.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListCubit, List<Movie>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => context.router.push(
                          const SettingsRoute(),
                        ),
                    child: const Text('Settings')),
                trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => context.router.push(
                          const NewsRoute(),
                        ),
                    child: const Text('News')),
                border: null,
              ),
              child: const NoMoviesPlaceholder());
        } else {
          return CupertinoPageScaffold(
            child: CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: const Text('Main'),
                  leading: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => context.router.push(
                            const SettingsRoute(),
                          ),
                      child: const Text('Settings')),
                  trailing: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => context.router.push(
                            const NewsRoute(),
                          ),
                      child: const Text('News')),
                  border: null,
                ),
                SliverList.separated(
                  itemBuilder: (context, index) {
                    final movie = state[index];
                    return Padding(
                      padding: pagePadding,
                      child: CustomContainer(
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () =>
                              context.router.push(MovieInfoRoute(index: index)),
                          child: CupertinoListTile(
                            padding: EdgeInsets.zero,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  movie.director,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                            subtitle: Row(
                              children: List.generate(
                                5,
                                (index) => Padding(
                                  padding: EdgeInsets.only(right: 4.w),
                                  child: Builder(
                                    builder: (context) {
                                      if (movie.rate! >= index) {
                                        return SvgPicture.asset(
                                          'assets/icons/star_filled.svg',
                                          width: 24.r,
                                          height: 24.r,
                                          colorFilter: ColorFilter.mode(
                                              CupertinoTheme.of(context)
                                                  .primaryColor,
                                              BlendMode.srcIn),
                                        );
                                      } else {
                                        return SvgPicture.asset(
                                          'assets/icons/star_unfilled.svg',
                                          width: 24.r,
                                          height: 24.r,
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
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: CupertinoTheme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemCount: state.length,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: pagePadding.copyWith(top: 16.h, bottom: 32.h),
                    child: const NewMovieButton(),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
