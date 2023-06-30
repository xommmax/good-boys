import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/common/ext/context_ext.dart';
import 'package:flutter_demo_app/common/service_locator.dart';
import 'package:flutter_demo_app/features/search/cubit/search_cubit.dart';
import 'package:flutter_demo_app/features/search/cubit/search_state.dart';
import 'package:flutter_demo_app/features/search/view/search_components.dart';
import 'package:flutter_demo_app/features/search/view/search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: const SearchView(),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchField(callback: context.read<SearchCubit>().searchBreeds)),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<SearchCubit, SearchState>(
              builder: (context, state) {
                switch (state.status) {
                  case SearchStatus.initial:
                    return const SearchInitial();
                  case SearchStatus.searching:
                    return const SearchLoading();
                  default:
                    return const SearchPopulated();
                }
              },
              listener: (context, state) {
                if (state.status == SearchStatus.failure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(context.l10n.commonError)));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
