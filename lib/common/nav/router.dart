import 'package:flutter_demo_app/features/breed/view/breed_details/breed_details_screen.dart';
import 'package:flutter_demo_app/features/breed/view/breeds/breeds_screen.dart';
import 'package:flutter_demo_app/features/yaynay/view/yaynay_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/breed/models/breed/breed.dart';
import '../../features/favorites/view/favorites_list_screen.dart';
import '../../features/search/view/search_screen.dart';
import '../view/scaffold_with_nav_bar.dart';

class AppRouter extends GoRouter {
  AppRouter()
      : super(
          initialLocation: '/breeds',
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
                      path: '/yaynay',
                      builder: (context, state) => const YayNayScreen(),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/breeds',
                      builder: (context, state) => const BreedsScreen(),
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
