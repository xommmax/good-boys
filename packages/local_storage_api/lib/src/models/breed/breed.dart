import 'package:isar/isar.dart';

part 'breed.g.dart';

@collection
class Breed {
  late Id id;
  late String name;
  late String imageUrl;
  String? weight;
  String? height;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
}
