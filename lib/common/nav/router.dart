import 'package:flutter_demo_app/features/breed/view/breed_details/breed_details_screen.dart';
import 'package:flutter_demo_app/features/breed/view/breed_list/breed_list_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/breed/models/breed/breed.dart';
import '../../features/favorites/view/favorites_list_screen.dart';
import '../../features/search/view/search.dart';
import '../view/scaffold_with_nav_bar.dart';

// GoRouter configuration
class AppRouter extends GoRouter {
  // temp router singleton for hot-reload purposes, remove later
  static final AppRouter _singleton = AppRouter._internal();

  factory AppRouter() {
    return _singleton;
  }

  AppRouter._internal()
      // AppRouter()
      : super(
          initialLocation: '/breedList',
          debugLogDiagnostics: true,
          routes: [
            StatefulShellRoute.indexedStack(
              builder: (context, state, navigationShell) {
                return ScaffoldWithNavBar(navigationShell: navigationShell);
              },
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/breedList',
                      builder: (context, state) => const BreedListScreen(),
                      routes: [
                        GoRoute(
                          path: 'breedDetails',
                          builder: (context, state) =>
                              BreedDetailsScreen(breed: state.extra as Breed),
                        )
                      ],
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/search',
                      builder: (context, state) => const SearchScreen(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/favorites',
                      builder: (context, state) => const FavoritesListScreen(),
                      routes: [
                        GoRoute(
                          path: 'breedDetails',
                          builder: (context, state) =>
                              BreedDetailsScreen(breed: state.extra as Breed),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
}
