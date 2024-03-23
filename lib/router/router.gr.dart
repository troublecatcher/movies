// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MovieInfoRoute.name: (routeData) {
      final args = routeData.argsAs<MovieInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieInfoScreen(
          key: args.key,
          index: args.index,
        ),
      );
    },
    NewMovieRoute.name: (routeData) {
      final args = routeData.argsAs<NewMovieRouteArgs>(
          orElse: () => const NewMovieRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewMovieScreen(
          key: args.key,
          movie: args.movie,
          index: args.index,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsScreen(),
      );
    },
    NewsSingleItemRoute.name: (routeData) {
      final args = routeData.argsAs<NewsSingleItemRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsSingleItemScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    OnboardingStartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingStartScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    PromotionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PromotionScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SupprotRouteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SupprotPageScreen(),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieInfoScreen]
class MovieInfoRoute extends PageRouteInfo<MovieInfoRouteArgs> {
  MovieInfoRoute({
    Key? key,
    required int index,
    List<PageRouteInfo>? children,
  }) : super(
          MovieInfoRoute.name,
          args: MovieInfoRouteArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieInfoRoute';

  static const PageInfo<MovieInfoRouteArgs> page =
      PageInfo<MovieInfoRouteArgs>(name);
}

class MovieInfoRouteArgs {
  const MovieInfoRouteArgs({
    this.key,
    required this.index,
  });

  final Key? key;

  final int index;

  @override
  String toString() {
    return 'MovieInfoRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [NewMovieScreen]
class NewMovieRoute extends PageRouteInfo<NewMovieRouteArgs> {
  NewMovieRoute({
    Key? key,
    Movie? movie,
    int? index,
    List<PageRouteInfo>? children,
  }) : super(
          NewMovieRoute.name,
          args: NewMovieRouteArgs(
            key: key,
            movie: movie,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'NewMovieRoute';

  static const PageInfo<NewMovieRouteArgs> page =
      PageInfo<NewMovieRouteArgs>(name);
}

class NewMovieRouteArgs {
  const NewMovieRouteArgs({
    this.key,
    this.movie,
    this.index,
  });

  final Key? key;

  final Movie? movie;

  final int? index;

  @override
  String toString() {
    return 'NewMovieRouteArgs{key: $key, movie: $movie, index: $index}';
  }
}

/// generated route for
/// [NewsScreen]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsSingleItemScreen]
class NewsSingleItemRoute extends PageRouteInfo<NewsSingleItemRouteArgs> {
  NewsSingleItemRoute({
    Key? key,
    required News news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsSingleItemRoute.name,
          args: NewsSingleItemRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsSingleItemRoute';

  static const PageInfo<NewsSingleItemRouteArgs> page =
      PageInfo<NewsSingleItemRouteArgs>(name);
}

class NewsSingleItemRouteArgs {
  const NewsSingleItemRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final News news;

  @override
  String toString() {
    return 'NewsSingleItemRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingStartScreen]
class OnboardingStartRoute extends PageRouteInfo<void> {
  const OnboardingStartRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingStartRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingStartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PromotionScreen]
class PromotionRoute extends PageRouteInfo<void> {
  const PromotionRoute({List<PageRouteInfo>? children})
      : super(
          PromotionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PromotionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SupprotPageScreen]
class SupprotRouteRoute extends PageRouteInfo<void> {
  const SupprotRouteRoute({List<PageRouteInfo>? children})
      : super(
          SupprotRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupprotRouteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
