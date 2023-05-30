// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_demo_app/features/breed/cubit/breed_list_cubit.dart';
import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:breed_repository/breed_repository.dart' as breed_repository;

import 'test_models.dart';

class MockBreedRepository extends Mock implements breed_repository.BreedRepository {}

void main() {
  group('BreedListCubit', () {
    late breed_repository.BreedRepository breedRepository;
    late BreedListCubit breedListCubit;
    const page = 3;

    setUp(() async {
      breedRepository = MockBreedRepository();
      when(
        () => breedRepository.getBreeds(page: any(named: 'page'), limit: any(named: 'limit')),
      ).thenAnswer((_) async => [testRepoBreed]);
      breedListCubit = BreedListCubit(breedRepository);
    });

    test('initial state is correct', () {
      final breedListCubit = BreedListCubit(breedRepository);
      expect(breedListCubit.state, BreedListState());
    });

    group('fetchBreedList', () {
      blocTest<BreedListCubit, BreedListState>(
        'emits nothing when page is negative',
        build: () => breedListCubit,
        act: (cubit) => cubit.fetchBreedList(page: -10),
        expect: () => <BreedListState>[],
      );

      blocTest<BreedListCubit, BreedListState>(
        'calls fetchBreedList with correct page',
        build: () => breedListCubit,
        act: (cubit) => cubit.fetchBreedList(page: page),
        verify: (_) {
          verify(() => breedRepository.getBreeds(page: page)).called(1);
        },
      );

      blocTest<BreedListCubit, BreedListState>(
        'emits [loading, failure] when fetchBreedList throws',
        setUp: () {
          when(
            () => breedRepository.getBreeds(page: any(named: 'page'), limit: any(named: 'limit')),
          ).thenThrow(Exception('oops'));
        },
        build: () => breedListCubit,
        act: (cubit) => cubit.fetchBreedList(page: page),
        expect: () => <BreedListState>[
          BreedListState(status: BreedListStatus.loading),
          BreedListState(status: BreedListStatus.failure),
        ],
      );

      blocTest<BreedListCubit, BreedListState>(
        'emits [loading, success] when fetchBreedList returns data',
        build: () => breedListCubit,
        act: (cubit) => cubit.fetchBreedList(page: page),
        expect: () => <dynamic>[
          BreedListState(status: BreedListStatus.loading),
          isA<BreedListState>().having((s) => s.status, 'status', BreedListStatus.success).having(
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

      blocTest<BreedListCubit, BreedListState>(
        'appends next page results to the current breed list during pagination',
        build: () => breedListCubit,
        act: (cubit) async {
          await cubit.fetchBreedList(page: 0);
          await cubit.fetchBreedList(page: 1);
        },
        expect: () => <dynamic>[
          BreedListState(status: BreedListStatus.loading),
          isA<BreedListState>()
              .having((s) => s.status, 'status', BreedListStatus.success)
              .having((s) => s.breeds.length, 'breedLength', 1),
          isA<BreedListState>().having((s) => s.status, 'status', BreedListStatus.loading),
          isA<BreedListState>()
              .having((s) => s.status, 'status', BreedListStatus.success)
              .having((s) => s.breeds.length, 'breedLength', 2),
        ],
      );
    });
  });
}
