import 'package:flutter/material.dart';

class SwipeableCard extends StatelessWidget {
  const SwipeableCard({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ColoredBox(
              color: Colors.grey.shade300,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  double loaded = progress.cumulativeBytesLoaded.toDouble();
                  double total = progress.expectedTotalBytes?.toDouble() ?? 1;
                  return Center(child: CircularProgressIndicator(value: loaded / total));
                },
              ),
            ),
          ),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.black12.withOpacity(0),
                Colors.black12.withOpacity(.5),
                Colors.black12.withOpacity(.8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
