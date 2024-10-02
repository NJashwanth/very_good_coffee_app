import 'package:dio/dio.dart';
import 'package:very_good_coffee_app/global/models/network_response_model.dart';

//This class handles all network related operations: get, set, update
class DataProvider {
  Future<NetworkResponseModel> fetchData(String url) async {
    try {
      final response = await Dio().get(url);
      return NetworkResponseModel(data: response.data);
    } on Exception catch (error) {
      return NetworkResponseModel(
          hasException: true, errorMessage: error.toString());
    }
  }

  Future download(String imageUrl, String filePath) async {
    Response response = await Dio().download(imageUrl, filePath);
    return response.data;
  }
}
