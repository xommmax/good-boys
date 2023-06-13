import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';
import 'package:go_router/go_router.dart';

class BreedListItem extends StatelessWidget {
  const BreedListItem({super.key, required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/breedList/breedDetails', extra: breed),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Hero(
                  tag: 'breed_image_${breed.id}',
                  child: CachedNetworkImage(
                    imageUrl: breed.imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(breed.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  if (breed.breedGroup != null)
                    Text(breed.breedGroup!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
