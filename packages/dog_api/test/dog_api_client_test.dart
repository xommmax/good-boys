import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dog_api/dog_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockBaseOptions extends Mock implements BaseOptions {}

class MockResponse extends Mock implements Response {}

void main() {
  group('DogApiClient', () {
    late Dio dioClient;
    late DogApiClient dogApiClient;
    late BaseOptions baseOptions;
    final random = Random();

    setUp(() {
      baseOptions = MockBaseOptions();
      when(() => baseOptions.headers).thenReturn({});
      dioClient = MockDio();
      when(() => dioClient.options).thenReturn(baseOptions);
      dogApiClient = DogApiClient(dioClient: dioClient);
    });

    group('constructor', () {
      test('instantiates internal dio client when not injected', () {
        expect(DogApiClient(), isNotNull);
      });
    });
    group('getBreeds', () {
      final page = random.nextInt(100);
      final limit = random.nextInt(100);
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn([]);
        when(() => dioClient.get(any(), queryParameters: any(named: 'queryParameters')))
            .thenAnswer((_) async => response);

        try {
          await dogApiClient.getBreeds(page: page, limit: limit);
        } catch (_) {}
        verify(
          () => dioClient.get(
            '/breeds',
            queryParameters: {
              'page': page,
              'limit': limit,
            },
          ),
        ).called(1);
      });
      test('throws error on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => response.data).thenReturn([]);
        when(() => dioClient.get(any(), queryParameters: any(named: 'queryParameters')))
            .thenAnswer((_) async => response);
        await expectLater(
          dogApiClient.getBreeds(),
          throwsA(isA<BreedRequestFailure>()),
        );
      });
      test('returns breed list on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn(jsonDecode(
          '''
  [
    {
      "id": 1,
      "name": "Affenpinscher"
    }
  ]''',
        ));
        when(() => dioClient.get(any(), queryParameters: any(named: 'queryParameters')))
            .thenAnswer((_) async => response);
        final actual = await dogApiClient.getBreeds();
        expect(actual, isNotEmpty);
        expect(
          actual[0],
          isA<Breed>().having((b) => b.id, 'id', 1).having((b) => b.name, 'name', 'Affenpinscher'),
        );
      });
    });
  });
}
