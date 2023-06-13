import 'dart:async';

import 'package:flutter/material.dart';

class BreedImageSlider extends StatefulWidget {
  const BreedImageSlider({super.key, required this.children});

  final List<Widget> children;

  @override
  State<BreedImageSlider> createState() => _BreedImageSliderState();
}

class _BreedImageSliderState extends State<BreedImageSlider> {
  Timer? _timer;
  PageController? _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 2), _onTimer);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onPanDown: (_) => _timer?.cancel(),
          child: PageView.builder(
            onPageChanged: (index) => setState(() => _currentPage = index),
            controller: _pageController,
            itemCount: widget.children.length,
            itemBuilder: (context, index) => widget.children[index],
            pageSnapping: true,
            allowImplicitScrolling: true,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withAlpha(150),
              Colors.black.withAlpha(150),
              Colors.transparent,
            ],
          )),
          height: 72,
        ),
        if (widget.children.length > 1)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.children.length, (int index) {
                return Container(
                  width: 5,
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Theme.of(context).colorScheme.primary.withAlpha(200)
                        : Colors.white.withAlpha(200),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }

  void _onTimer(Timer timer) {
    setState(() {
      if (_currentPage == widget.children.length - 1) {
        _currentPage = 0;
      } else {
        _currentPage++;
      }
    });

    _pageController?.animateToPage(_currentPage,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _pageController?.dispose();
  }
}
