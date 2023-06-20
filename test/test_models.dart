import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';
import 'package:breed_repository/breed_repository.dart' as breed_repository;

const testBreed = Breed(
  id: 1,
  name: 'Affenpinscher',
  weight: '3 - 6',
  height: '23 - 29',
  bredFor: 'Small rodent hunting, lapdog',
  breedGroup: 'Toy',
  lifeSpan: '10 - 12 years',
  temperament: 'Stubborn, Curious, Playful, Adventurous, Active, Fun-loving',
  origin: 'Germany, France',
  imageUrl: 'https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg',
  isFavorite: false,
);

const testRepoBreed = breed_repository.Breed(
  id: 2,
  name: 'Afghan Hound',
  weight: '23 - 27',
  height: '64 - 69',
  bredFor: 'Coursing and hunting',
  breedGroup: 'Hound',
  lifeSpan: '10 - 13 years',
  temperament: 'Aloof, Clownish, Dignified, Independent, Happy',
  origin: 'Afghanistan, Iran, Pakistan',
  imageUrl: 'https://cdn2.thedogapi.com/images/hMyT4CDXR.jpg',
  isFavorite: false,
);
