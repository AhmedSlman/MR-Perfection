import '../../../../core/network/dio_consumer.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final DioConsumer api;

  ProductRemoteDataSourceImpl({required this.api});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await api.get(AppStrings.productsEndpoint);
      final List<dynamic> data = response;
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(AppStrings.failedToLoadProducts);
    }
  }
}
