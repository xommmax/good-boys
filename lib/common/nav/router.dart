import 'package:go_router/go_router.dart';

import '../../features/breed/view/breed_details_screen.dart';
import '../../features/breed/view/breed_list_screen.dart';
import '../../features/favorites/view/favorites.dart';
import '../../features/search/view/search.dart';
import '../view/scaffold_with_nav_bar.dart';

// GoRouter configuration
class AppRouter extends GoRouter {
  AppRouter()
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
                          builder: (context, state) => const BreedDetailsScreen(),
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
                      builder: (context, state) => const FavoritesScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
}
