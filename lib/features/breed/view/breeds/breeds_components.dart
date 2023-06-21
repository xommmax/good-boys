import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/features/breed/cubit/breeds_cubit.dart';
import 'package:flutter_demo_app/features/breed/view/breeds/grid/breed_grid_item.dart';
import 'package:flutter_demo_app/features/breed/view/breeds/list/breed_list_item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

part 'list/breed_list_view.dart';
part 'grid/breed_grid_view.dart';

class BreedsLoading extends StatelessWidget {
  const BreedsLoading({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: CircularProgressIndicator());
}

class BreedsPopulated extends StatelessWidget {
  const BreedsPopulated({super.key, required this.viewType});

  final BreedsViewType viewType;

  @override
  Widget build(BuildContext context) {
    switch (viewType) {
      case BreedsViewType.grid:
        return const _GridView();
      default:
        return const _ListView();
    }
  }
}
