import 'package:dog_api/dog_api.dart';
import 'package:dio/dio.dart';

class BreedRequestFailure implements Exception {}

class DogApiClient {
  late Dio _dioClient;

  DogApiClient({Dio? dioClient}) {
    _dioClient = dioClient ??
        Dio(BaseOptions(
          baseUrl: 'https://api.thedogapi.com/v1',
          contentType: 'application/json',
        ));
    _dioClient.options.headers['x-api-key'] = const String.fromEnvironment('DOG_API_KEY');
  }

  Future<List<Breed>> getBreeds({int page = 0, int limit = 10}) async {
    final response = await _dioClient.get(
      '/breeds',
      queryParameters: {
        'page': page,
        'limit': limit,
      },
    );
    if (response.statusCode != 200) {
      throw BreedRequestFailure();
    }

    final breedsJson = response.data as List;

    return breedsJson.map((e) => Breed.fromJson(e)).toList();
  }
}
