import 'package:errors/errors.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather/weather.dart';

class MockRemoteDataSource extends Mock implements WeatherRemoteDataSource {}

class MockLocalDataSource extends Mock implements WeatherLocalDataSource {}

class MockLocation extends Mock implements LocationResponse {}

class MockWeather extends Mock implements WeatherResponse {}

void main() {
  late WeatherRemoteDataSource remoteDataSource;
  late WeatherLocalDataSource localDataSource;
  late WeatherRepository weatherRepository;

  setUp(() {
    localDataSource = MockLocalDataSource();
    remoteDataSource = MockRemoteDataSource();
    weatherRepository = WeatherRepository(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });

  group('searchLocation', () {
    test(
      'throws when locationSearch fails',
      () async {
        when(
          () => remoteDataSource.searchLocation(any()),
        ).thenThrow(ServerException());

        expect(
          () async => await weatherRepository.searchLocation('query'),
          throwsA(ServerException()),
        );
      },
    );
  });
}
