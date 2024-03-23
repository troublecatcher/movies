import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/movie.dart';
import 'package:movies/features/home/new_movie/movie_cubit.dart';
import 'package:movies/features/home/new_movie/new_movie_page_one.dart';
import 'package:movies/features/home/new_movie/new_movie_page_two.dart';
import 'package:movies/theme/const.dart';
import 'package:movies/shared/selector/selector_cubit.dart';

@RoutePage()
class NewMovieScreen extends StatefulWidget {
  final Movie? movie;
  final int? index;
  const NewMovieScreen({super.key, this.movie, this.index});

  @override
  State<NewMovieScreen> createState() => _NewMovieScreenState();
}

class _NewMovieScreenState extends State<NewMovieScreen> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: CupertinoPageScaffold(
          child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('New movie'),
            previousPageTitle: 'Back',
            border: null,
          ),
          SliverFillRemaining(
            child: Padding(
              padding: pagePadding,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  BlocProvider(
                    create: (context) => SelectorCubit(),
                    child: SingleChildScrollView(
                      child: NewMoviePageOne(
                        pageController: pageController,
                        movie: widget.movie,
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => SelectorCubit(),
                    child: SingleChildScrollView(
                      child: NewMoviePageTwo(
                        movie: widget.movie,
                        index: widget.index,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
