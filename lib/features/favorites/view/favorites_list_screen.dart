import 'package:breed_repository/breed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/common/ext/context_ext.dart';
import 'package:flutter_demo_app/features/breed/view/breeds/list/breed_list_item.dart';
import 'package:flutter_demo_app/features/favorites/cubit/favorites_list_cubit.dart';
import 'package:flutter_demo_app/features/favorites/cubit/favorites_list_state.dart';
import 'package:go_router/go_router.dart';

class FavoritesListScreen extends StatelessWidget {
  const FavoritesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesListCubit(context.read<BreedRepository>()),
      child: const FavoritesListView(),
    );
  }
}

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.favorites)),
      body: BlocBuilder<FavoritesListCubit, FavoritesListState>(builder: (context, state) {
        if (state.breeds == null) {
          return const SizedBox.shrink();
        }
        if (state.breeds!.isEmpty) {
          return const FavoritesListEmpty();
        }
        return ListView.separated(
          itemCount: state.breeds!.length,
          itemBuilder: (_, index) => BreedListItem(
            breed: state.breeds![index],
            callback: () => context.go('/favorites/breedDetails', extra: state.breeds![index]),
          ),
          separatorBuilder: (_, index) => Divider(
            height: 24,
            color: Colors.black.withAlpha(40),
          ),
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
        );
      }),
    );
  }
}

class FavoritesListEmpty extends StatelessWidget {
  const FavoritesListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.l10n.noFavoritesTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          context.l10n.noFavoritesSubtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
