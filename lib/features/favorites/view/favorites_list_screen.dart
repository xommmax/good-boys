import 'package:breed_repository/breed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/common/ext/context_ext.dart';
import 'package:flutter_demo_app/features/breed/view/breed_list/breed_list_item.dart';
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
        if (state.breeds != null) {
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
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
