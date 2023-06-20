import 'package:isar/isar.dart';

part 'breed.g.dart';

@collection
class Breed {
  late Id id;
  late String name;
  String? weight;
  String? height;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  late String imageUrl;
  late bool isFavorite;
}
