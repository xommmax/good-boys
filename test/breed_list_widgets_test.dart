// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:breed_repository/breed_repository.dart' hide Breed;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/features/breed/cubit/breed_list_cubit.dart';
import 'package:flutter_demo_app/features/breed/view/breed_list_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'test_models.dart';

class MockBreedRepository extends Mock implements BreedRepository {}

class MockBreedListCubit extends MockCubit<BreedListState> implements BreedListCubit {}

void main() {
  group('BreedListScreen', () {
    late BreedRepository breedRepository;

    setUp(() {
      breedRepository = MockBreedRepository();
      when(() => breedRepository.getBreeds(page: any(named: 'page'), limit: any(named: 'limit')))
          .thenAnswer((_) async => [testRepoBreed]);
    });

    testWidgets('renders BreedListView', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: breedRepository,
          child: MaterialApp(home: BreedListScreen()),
        ),
      );
      expect(find.byType(BreedListView), findsOneWidget);
    });

    testWidgets('loads initial breed list when page opens', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: breedRepository,
          child: MaterialApp(home: BreedListScreen()),
        ),
      );
      verify(() => breedRepository.getBreeds(page: 0, limit: any(named: 'limit'))).called(1);
    });
  });

  group('BreedListView', () {
    late BreedListCubit breedListCubit;

    setUp(() {
      breedListCubit = MockBreedListCubit();
    });

    testWidgets('renders BreedListEmpty for BreedListStatus.initial', (tester) async {
      when(() => breedListCubit.state).thenReturn(BreedListState());
      await tester.pumpWidget(
        BlocProvider.value(
          value: breedListCubit,
          child: MaterialApp(home: BreedListView()),
        ),
      );
      expect(find.byType(BreedListEmpty), findsOneWidget);
    });

    testWidgets('shows CircularProgressIndicator for BreedListStatus.loading', (tester) async {
      when(() => breedListCubit.state).thenReturn(BreedListState(status: BreedListStatus.loading));
      await tester.pumpWidget(
        BlocProvider.value(
          value: breedListCubit,
          child: MaterialApp(home: BreedListView()),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders BreedListPopulated for BreedListStatus.success', (tester) async {
      when(() => breedListCubit.state).thenReturn(BreedListState(status: BreedListStatus.success));
      await tester.pumpWidget(
        BlocProvider.value(
          value: breedListCubit,
          child: MaterialApp(home: BreedListView()),
        ),
      );
      expect(find.byType(BreedListPopulated), findsOneWidget);
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
