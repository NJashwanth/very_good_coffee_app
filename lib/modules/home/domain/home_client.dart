import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_coffee_app/global/constants.dart';

import 'package:very_good_coffee_app/global/data_provider.dart';
import 'package:very_good_coffee_app/global/models/network_response_model.dart';
import 'package:very_good_coffee_app/modules/home/models/coffee_model.dart';

class CoffeeClient {
  DataProvider _dataProvider = DataProvider();

  @visibleForTesting
  void setDataProvider(DataProvider dataProvider) {
    _dataProvider = dataProvider;
  }

  // Fetch coffee image from API
  Future<void> fetchCoffeeImage({
    required void Function(CoffeeModel coffee) onSuccess,
    required void Function(String? errorMessage) onError,
  }) async {
    final NetworkResponseModel response = await _dataProvider.fetchData(apiUrl);

    if (response.hasException) {
      onError(response.errorMessage);
      return;
    }
    debugPrint(response.data.toString());
    CoffeeModel coffee = CoffeeModel.fromJson(response.data ?? {});

    onSuccess(coffee);
    return;
  }

  // Get liked images from local storage
  Future<List<String>> getLikedImages() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(likedImages) ?? [];
  }

  // Save liked image locally
  Future<void> saveLikedImage(String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> likedImagesList = prefs.getStringList(likedImages) ?? [];
    if (!likedImagesList.contains(imageUrl)) {
      likedImagesList.add(imageUrl);
      await prefs.setStringList(likedImages, likedImagesList);
      debugPrint('Image link saved to local storage');
      // Save image to local storage
      await saveLikedImageLocally(imageUrl);
    }
  }

  // Remove liked image
  Future<void> removeLikedImage(String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> likedImagesList = prefs.getStringList(likedImages) ?? [];
    likedImagesList.remove(imageUrl);
    await prefs.setStringList(likedImages, likedImagesList);
  }

  // Save image to local storage
  Future<void> saveLikedImageLocally(String imageUrl) async {
    try {
      // Request storage permission
      await Permission.storage.request();

      // Get the device's document directory
      final directory = await getApplicationDocumentsDirectory();

      // Generate a local path for the image file
      final fileName = imageUrl.split('/').last;
      final filePath = '${directory.path}/$fileName';

      // Download the image and save it to the local file system
      final response = await _dataProvider.download(imageUrl, filePath);

      if (response.statusCode == 200) {
        debugPrint('Image saved to $filePath');
      }
    } catch (e) {
      debugPrint('Error saving image: $e');
    }
  }

  // Retrieve a locally saved image by file name
  Future<File?> getImageFileByName(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      if (await file.exists()) {
        return file; // Return the image file
      } else {
        return null; // If the file doesn't exist
      }
    } catch (e) {
      throw Exception('Error retrieving image: $e');
    }
  }

  Future<bool> getIsLiked(String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> likedImagesList = prefs.getStringList(likedImages) ?? [];

    return likedImagesList.contains(imageUrl);
  }
}
