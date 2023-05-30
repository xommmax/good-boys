import 'package:breed_repository/breed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/nav/router.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class BreedApp extends StatelessWidget {
  const BreedApp({required BreedRepository breedRepository, super.key}) : _breedRepository = breedRepository;

  final BreedRepository _breedRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _breedRepository,
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
