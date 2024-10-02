import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee_app/modules/home/domain/bloc/home_bloc.dart';
import 'package:very_good_coffee_app/modules/home/models/coffee_model.dart';
import 'package:very_good_coffee_app/modules/home/domain/home_client.dart';

class MockCoffeeClient extends Mock implements CoffeeClient {}

void main() {
  late HomeBloc homeBloc;
  late MockCoffeeClient mockCoffeeClient;

  setUp(() {
    mockCoffeeClient = MockCoffeeClient();
    homeBloc = HomeBloc();
    homeBloc.setCoffeeClient(mockCoffeeClient);
  });

  group('HomeBloc Tests', () {
    final mockCoffee = CoffeeModel(
        imageUrl: 'https://coffee.alexflipnote.dev/random', isLiked: false);
    final mockFavoriteList = ['https://coffee.alexflipnote.dev/random'];

    blocTest<HomeBloc, HomeState>(
      'emits [CoffeeLoadingState, CoffeeLoadedState] when LoadCoffeeEvent is successful',
      build: () {
        // Mocking the successful fetchCoffeeImage response
        when(() => mockCoffeeClient.fetchCoffeeImage(
            onSuccess: any(named: 'onSuccess'),
            onError: any(named: 'onError'))).thenAnswer((invocation) async {
          final onSuccess =
              invocation.namedArguments[#onSuccess] as Function(CoffeeModel);
          onSuccess(mockCoffee);
        });
        return homeBloc;
      },
      act: (bloc) => bloc.add(const LoadCoffeeEvent()),
      expect: () => [
        CoffeeLoadingState(),
        CoffeeLoadedState(coffeeModel: mockCoffee),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [CoffeeLoadingState, CoffeeErrorState] when LoadCoffeeEvent fails',
      build: () {
        // Mocking the failure in fetchCoffeeImage
        when(() => mockCoffeeClient.fetchCoffeeImage(
            onSuccess: any(named: 'onSuccess'),
            onError: any(named: 'onError'))).thenAnswer((invocation) async {
          final onError =
              invocation.namedArguments[#onError] as Function(String?);
          onError('Error fetching coffee');
        });
        return homeBloc;
      },
      act: (bloc) => bloc.add(const LoadCoffeeEvent()),
      expect: () => [
        CoffeeLoadingState(),
        CoffeeErrorState(),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'calls saveLikedImage on CoffeeClient when isLiked is true in UpdateLikedStatusEvent',
      build: () {
        when(() => mockCoffeeClient.saveLikedImage(any()))
            .thenAnswer((_) => Future<void>.value());
        return homeBloc;
      },
      act: (bloc) => bloc.add(UpdateLikedStatusEvent(
          imageUrl: mockCoffee.imageUrl ?? '', isLiked: true)),
      verify: (_) {
        verify(() => mockCoffeeClient.saveLikedImage(mockCoffee.imageUrl ?? ''))
            .called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'calls removeLikedImage on CoffeeClient when isLiked is false in UpdateLikedStatusEvent',
      build: () {
        when(() => mockCoffeeClient.removeLikedImage(any()))
            .thenAnswer((_) => Future<void>.value());
        return homeBloc;
      },
      act: (bloc) => bloc.add(UpdateLikedStatusEvent(
          imageUrl: mockCoffee.imageUrl ?? '', isLiked: false)),
      verify: (_) {
        verify(() =>
                mockCoffeeClient.removeLikedImage(mockCoffee.imageUrl ?? ''))
            .called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [FavLoadingState, FavLoadedState] when LoadFavoritesEvent is triggered',
      build: () {
        when(() => mockCoffeeClient.getLikedImages())
            .thenAnswer((_) async => mockFavoriteList);
        return homeBloc;
      },
      act: (bloc) => bloc.add(LoadFavoritesEvent()),
      expect: () => [
        FavLoadingState(),
        FavLoadedState(favs: mockFavoriteList),
      ],
    );
  });
}
