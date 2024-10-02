import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_coffee_app/global/constants.dart';
import 'package:very_good_coffee_app/global/data_provider.dart';
import 'package:very_good_coffee_app/global/models/network_response_model.dart';
import 'package:very_good_coffee_app/modules/home/models/coffee_model.dart';
import 'package:very_good_coffee_app/modules/home/domain/home_client.dart';

// Mock dependencies
class MockDataProvider extends Mock implements DataProvider {}

class MockPermissionHandler extends Mock implements Permission {}

void main() {
  late CoffeeClient coffeeClient;
  late MockDataProvider mockDataProvider;

  setUpAll(() {
    mockDataProvider = MockDataProvider();
    coffeeClient = CoffeeClient();
    coffeeClient.setDataProvider(mockDataProvider);
  });

  group('CoffeeClient Tests', () {
    // Test fetchCoffeeImage success
    test('fetchCoffeeImage should emit success callback when data is fetched',
        () async {
      final coffeeData = {
        'file': 'https://coffee.alexflipnote.dev/random',
        'isLiked': false,
      };

      // Mock successful fetch
      when(() => mockDataProvider.fetchData(apiUrl)).thenAnswer((_) async =>
          NetworkResponseModel(data: coffeeData, hasException: false));

      onSuccess(CoffeeModel coffee) {
        expect(
            coffee.imageUrl, equals('https://coffee.alexflipnote.dev/random'));
      }

      onError(String? errorMessage) {
        fail('Error should not be called');
      }

      await coffeeClient.fetchCoffeeImage(
          onSuccess: onSuccess, onError: onError);
    });

    // Test fetchCoffeeImage error
    test(
        'fetchCoffeeImage should emit error callback when there is an exception',
        () async {
      // Mock fetch failure
      when(() => mockDataProvider.fetchData(apiUrl)).thenAnswer((_) async =>
          NetworkResponseModel(
              hasException: true, errorMessage: 'Network error'));

      onSuccess(CoffeeModel coffee) {
        fail('Success should not be called');
      }

      onError(String? errorMessage) {
        expect(errorMessage, 'Network error');
      }

      await coffeeClient.fetchCoffeeImage(
          onSuccess: onSuccess, onError: onError);
    });

    // Test saveLikedImage
    test(
        'saveLikedImage should store liked image URL and save to local storage',
        () async {
      final prefs = <String, List<String>>{likedImages: []};
      SharedPreferences.setMockInitialValues(prefs);

      const coffeeImageUrl = 'https://coffee.alexflipnote.dev/random';

      await coffeeClient.saveLikedImage(coffeeImageUrl);

      final storedImages =
          (await SharedPreferences.getInstance()).getStringList(likedImages);
      expect(storedImages, contains(coffeeImageUrl));
    });

    // Test removeLikedImage
    test('removeLikedImage should remove liked image from local storage',
        () async {
      final prefs = <String, List<String>>{
        likedImages: ['https://coffee.alexflipnote.dev/random']
      };
      SharedPreferences.setMockInitialValues(prefs);

      const coffeeImageUrl = 'https://coffee.alexflipnote.dev/random';

      await coffeeClient.removeLikedImage(coffeeImageUrl);

      final storedImages =
          (await SharedPreferences.getInstance()).getStringList(likedImages);
      expect(storedImages, isNot(contains(coffeeImageUrl)));
    });

    // Test getLikedImages
    test('getLikedImages should return liked images from local storage',
        () async {
      final prefs = <String, List<String>>{
        likedImages: ['https://coffee.alexflipnote.dev/random']
      };
      SharedPreferences.setMockInitialValues(prefs);

      final likedImagesList = await coffeeClient.getLikedImages();
      expect(likedImagesList, ['https://coffee.alexflipnote.dev/random']);
    });

    // Test getIsLiked
    test('getIsLiked should return true if image URL is in liked list',
        () async {
      final prefs = <String, List<String>>{
        likedImages: ['https://coffee.alexflipnote.dev/random']
      };
      SharedPreferences.setMockInitialValues(prefs);

      final isLiked = await coffeeClient
          .getIsLiked('https://coffee.alexflipnote.dev/random');
      expect(isLiked, isTrue);
    });

    test('getIsLiked should return false if image URL is not in liked list',
        () async {
      final prefs = <String, List<String>>{likedImages: []};
      SharedPreferences.setMockInitialValues(prefs);

      final isLiked = await coffeeClient
          .getIsLiked('https://coffee.alexflipnote.dev/random');
      expect(isLiked, isFalse);
    });
  });
}
