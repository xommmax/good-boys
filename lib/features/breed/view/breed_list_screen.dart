import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/features/breed/cubit/breed_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/breed/breed.dart';

part 'breed_list_screen_components.dart';

class BreedListScreen extends StatelessWidget {
  const BreedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BreedListCubit(context.read<BreedRepository>())..fetchInitialPage(),
      child: const BreedListView(),
    );
  }
}

class BreedListView extends StatelessWidget {
  const BreedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Good Boys Catalogue')),
      body: BlocBuilder<BreedListCubit, BreedListState>(
        builder: (context, state) {
          switch (state.status) {
            case BreedListStatus.initial:
              return const BreedListEmpty();
            case BreedListStatus.loading:
              return const BreedListLoading();
            case BreedListStatus.success:
              return BreedListPopulated(breeds: state.breeds);
            case BreedListStatus.failure:
              return const BreedListError();
            default:
              return const Placeholder();
          }
        },
      ),
    );
  }
}
