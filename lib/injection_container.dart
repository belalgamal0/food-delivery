import 'features/basket/presentation/bloc/basket_bloc.dart';
import 'features/favorite/data/repository/favorite_repository_impl.dart';
import 'features/favorite/domain/usecase/is_cached_usecase.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'features/favorite/data/datasources/favorite_local_datasource.dart';
import 'features/favorite/domain/repository/favorite_repository.dart';
import 'features/favorite/domain/usecase/favorite_usecase.dart';
import 'features/favorite/presentation/bloc/favorite_bloc.dart';
import 'features/home/data/data_sources/food_remote_data_source.dart';
import 'features/home/data/repository/food_repository_impl.dart';
import 'features/home/domain/repository/food_repository.dart';
import 'features/home/domain/usecase/get_foods_usecase.dart';
import 'package:hive/hive.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

final services = GetIt.instance;
Future<void> init() async {
  //! Features: Get foods - Set favorite - Add to basket
  // Bloc
  services.registerFactory(
    () => HomeBloc(services()),
  );
  services.registerFactory(
    () => BasketBloc(),
  );
  services.registerFactory(
    () => FavoriteBloc(services(), services()),
  );

  // Use cases
  services.registerLazySingleton(() => GetFoodsUseCase(services()));
  services.registerLazySingleton(() => FavoritesFoodUseCase(services()));
  services.registerLazySingleton(() => IsCachedUseCase(services()));

  // Repository
  services.registerLazySingleton<FoodRepository>(
    () => FoodRepositoryImpl(networkInfo: services(), remoteDataSource: services()),
  );

  services.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(favoritesLocalDataSource: services()),
  );

  // Data sources
  services.registerLazySingleton<FoodRemoteDataSource>(
    () => FoodRemoteDataSourceImpl(client: services()),
  );
  services.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(hive: services()),
  );

  //! Core
  services.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(services()));

  //! External
  services.registerLazySingleton<HiveInterface>(() => Hive);
  services.registerLazySingleton(() => http.Client());
  services.registerLazySingleton(() => InternetConnectionChecker());
}
