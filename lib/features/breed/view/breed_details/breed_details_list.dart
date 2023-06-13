import 'package:flutter/material.dart';
import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class BreedDetailsList extends StatelessWidget {
  const BreedDetailsList(this.breed, {super.key});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return SliverList.list(
      children: [
        if (breed.weight != null) _ListItem(l10n.weight, '${breed.weight} ${l10n.kg}'),
        if (breed.height != null) _ListItem(l10n.height, '${breed.height} ${l10n.cm}'),
        if (breed.bredFor != null) _ListItem(l10n.bredFor, breed.bredFor),
        if (breed.breedGroup != null) _ListItem(l10n.breedGroup, breed.breedGroup),
        if (breed.lifeSpan != null) _ListItem(l10n.lifeSpan, breed.lifeSpan),
        if (breed.temperament != null) _ListItem(l10n.temperament, breed.temperament),
        if (breed.origin != null) _ListItem(l10n.origin, breed.origin),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem(this.title, this.value);

  final String title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: '$title:',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.75),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(
                text: ' $value',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.75),
                  fontSize: 16,
                )),
          ],
        ),
      ),
    );
  }
}
