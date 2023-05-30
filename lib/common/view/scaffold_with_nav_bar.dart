import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          // Here, the items of BottomNavigationBar are hard coded. In a real
          // world scenario, the items would most likely be generated from the
          // branches of the shell route, which can be fetched using
          // `navigationShell.route.branches`.
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.dog),
            label: L10n.of(context).breeds,
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: L10n.of(context).search,
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.solidStar),
            label: L10n.of(context).favorites,
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex),
      ),
    );
  }
}
