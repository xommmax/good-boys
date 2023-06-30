import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/common/ext/context_ext.dart';
import 'package:flutter_demo_app/common/service_locator.dart';
import 'package:flutter_demo_app/features/yaynay/cubit/yaynay_cubit.dart';
import 'package:flutter_demo_app/features/yaynay/cubit/yaynay_state.dart';
import 'package:flutter_demo_app/features/yaynay/view/swipeable/swipeable_view.dart';

class YayNayScreen extends StatelessWidget {
  const YayNayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<YayNayCubit>(),
      child: const YayNayView(),
    );
  }
}

class YayNayView extends StatelessWidget {
  const YayNayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.yaynay)),
      body: BlocBuilder<YayNayCubit, YayNayState>(builder: (context, state) {
        if (state.imageUrls.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SwipeableView();
        }
      }),
    );
  }
}
