// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:breed_repository/breed_repository.dart' hide Breed;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/features/breed/cubit/breeds_cubit.dart';
import 'package:flutter_demo_app/features/breed/view/breeds/breeds_components.dart';
import 'package:flutter_demo_app/features/breed/view/breeds/breeds_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'test_models.dart';

class MockBreedRepository extends Mock implements BreedRepository {}

class MockBreedListCubit extends MockCubit<BreedsState> implements BreedsCubit {}

void main() {
  group('BreedListScreen', () {
    late BreedRepository breedRepository;

    setUp(() {
      breedRepository = MockBreedRepository();
      when(() => breedRepository.getBreeds(page: any(named: 'page'), limit: any(named: 'limit')))
          .thenAnswer((_) async => [testRepoBreed]);
    });

    testWidgets('renders BreedsView', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: breedRepository,
          child: MaterialApp(home: BreedsScreen()),
        ),
      );
      expect(find.byType(BreedsView), findsOneWidget);
    });

    testWidgets('loads initial breed list when page opens', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: breedRepository,
          child: MaterialApp(home: BreedsScreen()),
        ),
      );
      verify(() => breedRepository.getBreeds(page: 0, limit: any(named: 'limit'))).called(1);
    });
  });

  group('BreedListView', () {
    late BreedsCubit breedListCubit;

    setUp(() {
      breedListCubit = MockBreedListCubit();
    });

    testWidgets('renders BreedsLoading for BreedListStatus.initial', (tester) async {
      when(() => breedListCubit.state).thenReturn(BreedsState());
      await tester.pumpWidget(
        BlocProvider.value(
          value: breedListCubit,
          child: MaterialApp(home: BreedsView()),
        ),
      );
      expect(find.byType(BreedsLoading), findsOneWidget);
    });

    testWidgets('shows CircularProgressIndicator for BreedListStatus.initial', (tester) async {
      when(() => breedListCubit.state).thenReturn(BreedsState(status: BreedsStatus.initial));
      await tester.pumpWidget(
        BlocProvider.value(
          value: breedListCubit,
          child: MaterialApp(home: BreedsView()),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders BreedsPopulated for BreedListStatus.success', (tester) async {
      when(() => breedListCubit.state).thenReturn(BreedsState(status: BreedsStatus.success));
      await tester.pumpWidget(
        BlocProvider.value(
          value: breedListCubit,
          child: MaterialApp(home: BreedsView()),
        ),
      );
      expect(find.byType(BreedsPopulated), findsOneWidget);
    });

    // testWidgets('navigates to BreedDetailsScreen when breed is selected', (tester) async {
    //   when(() => breedListCubit.state).thenReturn(BreedListState());
    //   await tester.pumpWidget(
    //     BlocProvider.value(
    //       value: breedListCubit,
    //       child: MaterialApp(home: BreedListView()),
    //     ),
    //   );
    //   await tester.tap(find.byType(BreedItem));
    //   await tester.pumpAndSettle();
    //   expect(find.byType(BreedDetailsScreen), findsOneWidget);
    // });
  });
}
