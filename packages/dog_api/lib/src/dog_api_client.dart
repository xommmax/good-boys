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

  Future<List<Breed>> getBreeds({int page = 0, int limit = 20}) async {
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

  Future<List<Breed>> search(String query) async {
    final response = await _dioClient.get('/breeds/search', queryParameters: {
      'q': query,
    });

    if (response.statusCode != 200) {
      throw BreedRequestFailure();
    }

    final breedsJson = response.data as List;

    return breedsJson.map((e) {
      if (e['image'] == null) {
        e['image'] = {'url': 'https://cdn2.thedogapi.com/images/${e["reference_image_id"]}.jpg'};
      }
      return Breed.fromJson(e);
    }).toList();
  }

  Future<List<String>> getBreedImages(int breedId) async {
    final response = await _dioClient.get(
      '/images/search',
      queryParameters: {
        'limit': 10,
        'breed_id': breedId,
        'include_breeds': false,
        'size': 'full',
      },
    );
    if (response.statusCode != 200) {
      throw BreedRequestFailure();
    }

    final imagesJson = response.data as List;

    return imagesJson.map((e) => e['url'] as String).toList();
  }
}
