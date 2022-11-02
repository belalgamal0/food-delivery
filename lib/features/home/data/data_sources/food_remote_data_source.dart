import 'dart:convert';
import '../../../../core/api_provider/api_provider.dart';
import '../../../../core/api_provider/utils.dart';
import '../../../../core/failure/exception.dart';
import '../model/food_model.dart';
import 'package:http/http.dart' as http;

abstract class FoodRemoteDataSource {
  Future<List<FoodModel>> getfoods(String category);
}

class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  final http.Client client;
  const FoodRemoteDataSourceImpl({required this.client});
  @override
  Future<List<FoodModel>> getfoods(String category) =>
      _getFoodFromUrl(category);
  Future<List<FoodModel>> _getFoodFromUrl(String category) async {
    final response = await client.get(
        Uri.https(Utils.getFoodAuthority, '/$category'),
        headers: ApiProvider.requestHeader);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<FoodModel> foodListModels = jsonResponse.map((foodModel) => FoodModel.fromJson(foodModel)).toList();
      return foodListModels;
    } else {
      throw ServerException();
    }
  }
}
