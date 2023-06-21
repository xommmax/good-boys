import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/common/ext/context_ext.dart';
import 'package:flutter_demo_app/features/breed/view/breeds/list/breed_list_item.dart';
import 'package:flutter_demo_app/features/search/cubit/search_cubit.dart';
import 'package:flutter_demo_app/features/search/cubit/search_state.dart';
import 'package:go_router/go_router.dart';

class SearchInitial extends StatelessWidget {
  const SearchInitial({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class SearchLoading extends StatelessWidget {
  const SearchLoading({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: CircularProgressIndicator());
}

class SearchPopulated extends StatelessWidget {
  const SearchPopulated({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
        if (state.breeds.isEmpty) {
          return const SearchEmpty();
        }
        return ListView.separated(
          itemCount: state.breeds.length,
          itemBuilder: (_, index) => BreedListItem(
            breed: state.breeds[index],
            callback: () => context.go('/search/breedDetails', extra: state.breeds[index]),
          ),
          separatorBuilder: (_, index) => Divider(
            height: 24,
            color: Colors.black.withAlpha(40),
          ),
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
        );
      });
}

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      context.l10n.noSearchResults,
      style: const TextStyle(
        fontSize: 16,
      ),
    ));
  }
}
