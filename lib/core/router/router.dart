import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/features/home/data/model/note_model.dart';

import '../../features/home/ui/view/home_details_page.dart';
import '../../features/home/ui/view/home_page.dart';
import '../../features/splash/splash_page.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.splashPage,
      name: Routes.splashPage,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: Routes.homePage,
      name: Routes.homePage,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: Routes.homeDetailsPage,
      name: Routes.homeDetailsPage,
      builder: (BuildContext context, GoRouterState state) {
        final note = state.extra as NoteModel;
        return HomeDetailsPage(note: note);
      },
    ),
  ],
);
