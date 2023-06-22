import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swipable_stack/swipable_stack.dart';

class BottomButtonsRow extends StatelessWidget {
  const BottomButtonsRow({super.key, required this.onSwipe});

  final ValueChanged<SwipeDirection> onSwipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomButton(
              color: Colors.red,
              child: const FaIcon(FontAwesomeIcons.solidThumbsDown),
              onPressed: () => onSwipe(SwipeDirection.left),
            ),
            _BottomButton(
              color: Colors.green,
              onPressed: () => onSwipe(SwipeDirection.right),
              child: const FaIcon(FontAwesomeIcons.solidThumbsUp),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({
    required this.onPressed,
    required this.child,
    required this.color,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
