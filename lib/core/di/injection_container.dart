import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../network/dio_consumer.dart';
import '../cached/cache_helper.dart';
import '../../features/products/data/datasources/product_remote_data_source.dart';
import '../../features/products/data/repositories/product_repository_impl.dart';
import '../../features/products/domain/repositories/product_repository.dart';
import '../../features/products/domain/usecases/get_products.dart';
import '../../features/products/presentation/bloc/product_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // External
  await CacheHelper.init();

  final dio = Dio();
  getIt.registerLazySingleton(() => dio);

  getIt.registerLazySingleton<DioConsumer>(
    () => DioConsumer(dio: getIt()),
  );

  // Data sources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(api: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetProducts(getIt()));

  // BLoC
  getIt.registerFactory(
    () => ProductBloc(getProducts: getIt()),
  );
}
