// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_demo_app/features/breed/cubit/breeds_cubit.dart';
import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:breed_repository/breed_repository.dart' as breed_repository;

import 'test_models.dart';

class MockBreedRepository extends Mock implements breed_repository.BreedRepository {}

void main() {
  group('BreedListCubit', () {
    late breed_repository.BreedRepository breedRepository;
    late BreedsCubit breedListCubit;
    const page = 3;

    setUp(() async {
      breedRepository = MockBreedRepository();
      when(
        () => breedRepository.getBreeds(page: any(named: 'page'), limit: any(named: 'limit')),
      ).thenAnswer((_) async => [testRepoBreed]);
      breedListCubit = BreedsCubit(breedRepository);
    });

    test('initial state is correct', () {
      final breedListCubit = BreedsCubit(breedRepository);
      expect(breedListCubit.state, BreedsState());
    });

    group('fetchBreedList', () {
      blocTest<BreedsCubit, BreedsState>(
        'emits nothing when page is negative',
        build: () => breedListCubit,
        act: (cubit) => cubit.fetchPage(page: -10),
        expect: () => <BreedsState>[],
      );

      blocTest<BreedsCubit, BreedsState>(
        'calls fetchBreedList with correct page',
        build: () => breedListCubit,
        act: (cubit) => cubit.fetchPage(page: page),
        verify: (_) {
          verify(() => breedRepository.getBreeds(page: page)).called(1);
        },
      );

      blocTest<BreedsCubit, BreedsState>(
        'emits [loading, failure] when fetchBreedList throws',
        setUp: () {
          when(
            () => breedRepository.getBreeds(page: any(named: 'page'), limit: any(named: 'limit')),
          ).thenThrow(Exception('oops'));
        },
        build: () => breedListCubit,
        act: (cubit) => cubit.fetchInitialPage(),
        expect: () => <BreedsState>[
          BreedsState(status: BreedsStatus.initial),
          BreedsState(status: BreedsStatus.failure),
        ],
      );

      blocTest<BreedsCubit, BreedsState>(
        'emits [loading, success] when fetchBreedList returns data',
        build: () => breedListCubit,
        act: (cubit) => cubit.fetchInitialPage(),
        expect: () => <dynamic>[
          BreedsState(status: BreedsStatus.initial),
          isA<BreedsState>().having((s) => s.status, 'status', BreedsStatus.success).having(
              (s) => s.breeds[0],
              'breed',
              isA<Breed>()
                  .having((b) => b.weight, 'weight', testRepoBreed.weight)
                  .having((b) => b.height, 'height', testRepoBreed.height)
                  .having((b) => b.name, 'name', testRepoBreed.name)
                  .having((b) => b.bredFor, 'bredFor', testRepoBreed.bredFor)
                  .having((b) => b.breedGroup, 'breedGroup', testRepoBreed.breedGroup)
                  .having((b) => b.lifeSpan, 'lifeSpan', testRepoBreed.lifeSpan)
                  .having((b) => b.temperament, 'temperament', testRepoBreed.temperament)
                  .having((b) => b.origin, 'origin', testRepoBreed.origin)
                  .having((b) => b.imageUrl, 'imageUrl', testRepoBreed.imageUrl)),
        ],
      );

      blocTest<BreedsCubit, BreedsState>(
        'appends next page results to the current breed list during pagination',
        build: () => breedListCubit,
        act: (cubit) async {
          await cubit.fetchInitialPage();
          await cubit.fetchNextPage();
        },
        expect: () => <dynamic>[
          BreedsState(status: BreedsStatus.initial),
          isA<BreedsState>()
              .having((s) => s.status, 'status', BreedsStatus.success)
              .having((s) => s.breeds.length, 'breedLength', 1),
          isA<BreedsState>().having((s) => s.status, 'status', BreedsStatus.fetchMore),
          isA<BreedsState>()
              .having((s) => s.status, 'status', BreedsStatus.success)
              .having((s) => s.breeds.length, 'breedLength', 2),
        ],
      );
    });
  });
}
