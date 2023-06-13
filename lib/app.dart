import 'package:breed_repository/breed_repository.dart';
import 'package:favorites_repository/favorites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/nav/router.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class BreedApp extends StatelessWidget {
  const BreedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => BreedRepository()),
        RepositoryProvider(create: (context) => FavoritesRepository()),
      ],
      child: const BreedAppView(),
    );
  }
}

class BreedAppView extends StatelessWidget {
  const BreedAppView({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: AppRouter(),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
      );
}
