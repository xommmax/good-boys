import 'package:flutter/material.dart';
import 'package:flutter_demo_app/common/service_locator.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';

class BreedApp extends StatelessWidget {
  const BreedApp({super.key});

  @override
  Widget build(BuildContext context) => const BreedAppView();
}

class BreedAppView extends StatelessWidget {
  const BreedAppView({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: getIt<GoRouter>(),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
      );
}
