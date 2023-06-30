import 'package:flutter/material.dart';
import 'package:flutter_demo_app/common/ext/context_ext.dart';
import 'package:flutter_demo_app/common/service_locator.dart';
import 'package:flutter_demo_app/features/breed/cubit/breeds_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/features/breed/view/breeds/breeds_components.dart';

class BreedsScreen extends StatelessWidget {
  const BreedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BreedsCubit>(),
      child: const BreedsView(),
    );
  }
}

class BreedsView extends StatelessWidget {
  const BreedsView({super.key});

  @override
  Widget build(BuildContext context) => BlocConsumer<BreedsCubit, BreedsState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Good Boys Catalogue'), actions: [
            IconButton(
              onPressed: context.read<BreedsCubit>().switchViewType,
              icon: Icon(state.viewType == BreedsViewType.grid ? Icons.grid_on : Icons.view_list),
            )
          ]),
          body: Builder(builder: (context) {
            switch (state.status) {
              case BreedsStatus.initial:
                return const BreedsLoading();
              default:
                return BreedsPopulated(viewType: state.viewType);
            }
          }),
        ),
        listener: (context, state) {
          if (state.status == BreedsStatus.failure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(context.l10n.commonError)));
          }
        },
      );
}
