import 'package:get_it/get_it.dart';
import 'package:traind_app/features/authentication/data/data%20source/register_remote_data_source.dart';
import 'package:traind_app/features/authentication/data/repository/register_data_repository.dart';
import 'package:traind_app/features/authentication/domain/repository/register_domain_repository.dart';
import 'package:traind_app/features/authentication/domain/usecase/register_usecase.dart';
import 'package:traind_app/features/tickets/data/stations/data%20source/get_remote_stations_data.dart';
import 'package:traind_app/features/tickets/data/stations/repository/get_stations_data_repository.dart';
import 'package:traind_app/features/tickets/domain/stations/repository/get_stations_repository.dart';
import 'package:traind_app/features/tickets/domain/stations/usecase/get_stations_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
        () => RegisterRemoteDataSource());
    sl.registerLazySingleton<BaseRegisterRepository>(
        () => RegisterRepository(sl()));
    sl.registerLazySingleton(() => PostRegisterDataUseCase(sl()));

    sl.registerLazySingleton<BaseGetRemoteStationsDataSource>(
        () => GetRemoteStationsDataSource());
    sl.registerLazySingleton<BaseGetStationsRepository>(
        () => StationsRepository(sl()));
    sl.registerLazySingleton(() => GetStationsUseCase(sl()));
    /*sl.registerLazySingleton(
        () => RegisterResponseModel(token: sl(), message: sl()));*/
  }
}
