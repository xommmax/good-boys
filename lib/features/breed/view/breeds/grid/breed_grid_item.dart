import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';

class BreedGridItem extends StatelessWidget {
  const BreedGridItem({super.key, required this.breed, required this.callback});

  final Breed breed;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Hero(
                  tag: 'breed_image_${breed.id}',
                  child: CachedNetworkImage(
                    imageUrl: breed.imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorWidget: (context, url, error) => const Center(child: Text('No image')),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(breed.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
