import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movies/main.dart';
import 'package:movies/features/home/main/layout/home_screen.dart';

import '../data/movie.dart';
import '../features/home/movie_info/movie_info_screen.dart';
import '../features/home/new_movie/new_movie_screen.dart';
import '../features/news/news.dart';
import '../features/news/news_single_item_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/onboarding/onboarding_start_screen.dart';
import '../features/news/news_screen.dart';
import '../features/settings/privacy_policy_screen.dart';
import '../features/settings/promotion_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/settings/support_page.dart';
import '../features/settings/terms_of_use_screen.dart';

part 'router.gr.dart';

final showPromotion = promotion != null && promotion != '';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: OnboardingRoute.page,
            initial: isFirstTime! && !showPromotion),
        AutoRoute(page: OnboardingStartRoute.page),
        AutoRoute(
            page: HomeRoute.page, initial: !isFirstTime! && !showPromotion),
        AutoRoute(page: MovieInfoRoute.page),
        AutoRoute(page: NewMovieRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: NewsRoute.page),
        AutoRoute(page: NewsSingleItemRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),
        AutoRoute(page: TermsOfUseRoute.page),
        AutoRoute(page: SupprotRouteRoute.page),
        AutoRoute(page: PromotionRoute.page, initial: showPromotion),
      ];
}
