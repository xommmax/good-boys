import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:flutter_demo_app/common/nav/router.dart';
import 'package:flutter_demo_app/features/breed/cubit/breed_details_cubit.dart';
import 'package:flutter_demo_app/features/breed/cubit/breeds_cubit.dart';
import 'package:flutter_demo_app/features/breed/models/models.dart';
import 'package:flutter_demo_app/features/favorites/cubit/favorites_list_cubit.dart';
import 'package:flutter_demo_app/features/search/cubit/search_cubit.dart';
import 'package:flutter_demo_app/features/yaynay/cubit/yaynay_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    getIt
      ..registerSingleton<GoRouter>(AppRouter())
      ..registerSingleton<BreedRepository>(BreedRepository())
      ..registerFactory<BreedsCubit>(() => BreedsCubit(
            breedRepository: getIt(),
          ))
      ..registerFactoryParam<BreedDetailsCubit, Breed, void>((breed, _) => BreedDetailsCubit(
            breed: breed,
            breedRepository: getIt(),
          ))
      ..registerFactory<FavoritesListCubit>(() => FavoritesListCubit(
            breedRepository: getIt(),
          ))
      ..registerFactory<SearchCubit>(() => SearchCubit(
            breedRepository: getIt(),
          ))
      ..registerFactory<YayNayCubit>(() => YayNayCubit(
            breedRepository: getIt(),
          ));
  }
}
