import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/features/yaynay/cubit/yaynay_cubit.dart';
import 'package:flutter_demo_app/features/yaynay/cubit/yaynay_state.dart';
import 'package:flutter_demo_app/features/yaynay/view/swipeable/swipeable_card.dart';
import 'package:swipable_stack/swipable_stack.dart';

import 'bottom_buttons_row.dart';

const _images = [
  'https://cdn2.thedogapi.com/images/SyeodOnBQ_390x256.jpg',
  'https://cdn2.thedogapi.com/images/pC7MjGeaT.jpg',
  'https://cdn2.thedogapi.com/images/aQkrp7YWk.jpg',
];

class SwipeableView extends StatefulWidget {
  const SwipeableView({super.key});

  @override
  SwipeableViewState createState() => SwipeableViewState();
}

class SwipeableViewState extends State<SwipeableView> {
  late final SwipableStackController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: BlocBuilder<YayNayCubit, YayNayState>(
              builder: (context, state) {
                return SwipableStack(
                  stackClipBehaviour: Clip.none,
                  detectableSwipeDirections: const {
                    SwipeDirection.right,
                    SwipeDirection.left,
                  },
                  controller: _controller,
                  onSwipeCompleted: (index, direction) {
                    print('onSwipeCompleted $index');
                    if (index % 10 == 0 && index != 0) {
                      context.read<YayNayCubit>().loadRandomBreeds();
                    }
                  },
                  builder: (context, properties) {
                    final imageUrl = state.imageUrls[properties.index];
                    return SwipeableCard(imageUrl: imageUrl);
                  },
                );
              },
            ),
          ),
        ),
        BottomButtonsRow(
          onSwipe: (direction) => _controller.next(swipeDirection: direction),
        ),
      ],
    );
  }
}
