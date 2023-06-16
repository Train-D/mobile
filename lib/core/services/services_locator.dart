import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:traind_app/core/services/api_service.dart';
import 'package:traind_app/features/authentication/data/data%20source/login_remote_data_source.dart';
import 'package:traind_app/features/authentication/data/data%20source/register_remote_data_source.dart';
import 'package:traind_app/features/authentication/data/repository/login_repository.dart';
import 'package:traind_app/features/authentication/data/repository/register_data_repository.dart';
import 'package:traind_app/features/authentication/domain/repository/base_login_repository.dart';
import 'package:traind_app/features/authentication/domain/repository/register_domain_repository.dart';
import 'package:traind_app/features/stations/data/all_stations_names_repository.dart';
import 'package:traind_app/features/stations/data/data%20source/all_stations_names_local_data_source.dart';
import 'package:traind_app/features/stations/domain/repository/base_all_stations_repository.dart';
import 'package:traind_app/features/stations/domain/usecase/get_all_stations_names_usecase.dart';
import 'package:traind_app/features/tickets/data/data%20source/fromto_data_sorce.dart';
import 'package:traind_app/features/tickets/data/repository/fromto_repository.dart';
import 'package:traind_app/features/tickets/domain/fromto_usecase.dart.dart';
import 'package:traind_app/features/tickets/domain/repository/fromto_domain_repository.dart';

import '../../features/authentication/domain/usecase/login_usecase.dart';
import '../../features/authentication/domain/usecase/register_usecase.dart';
import '../../features/layout/data/stations/data source/get_remote_stations_data.dart';
import '../../features/layout/data/stations/repository/get_stations_data_repository.dart';
import '../../features/layout/domain/stations/repository/get_stations_repository.dart';
import '../../features/layout/domain/stations/usecase/get_stations_usecase.dart';
import '../../features/profile/data/data source/profile_local_data_source.dart';
import '../../features/profile/data/data source/profile_remote_data_source.dart';
import '../../features/profile/data/repository/profile_repository.dart';
import '../../features/profile/domain/repository/base_profile_repository.dart';
import '../../features/profile/domain/usecase/get_profile_user_data_use_case.dart';
import '../../features/profile/domain/usecase/put_profile_user_data_use_case.dart';
import '../../features/stations/data/data source/all_stations_names_remote_data_source.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //auth feature
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
        () => RegisterRemoteDataSource());
    sl.registerLazySingleton<BaseRegisterRepository>(
        () => RegisterRepository(sl()));
    sl.registerLazySingleton(() => PostRegisterDataUseCase(sl()));

    // login
    sl.registerLazySingleton(() => LoginRemoteDataSource());
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));
    sl.registerLazySingleton(() => PostLoginDataUseCase(sl()));

    //layout feature
    sl.registerLazySingleton<BaseGetRemoteStationsDataSource>(
        () => GetRemoteStationsDataSource());
    sl.registerLazySingleton<BaseGetStationsRepository>(
        () => StationsRepository(sl()));
    sl.registerLazySingleton(() => GetStationsUseCase(sl()));

    //fromto feature
    sl.registerLazySingleton<BaseFromToDateRemoteDataSource>(
        () => FromToDateRemoteDataSource());
    sl.registerLazySingleton<BaseFromToDateRepository>(
        () => FromToDateRepository(sl()));
    sl.registerLazySingleton(() => PostFromToDateDataUsecase(sl()));

    // profile
    sl.registerLazySingleton<ApiService>(() => ApiService(Dio()));
    sl.registerLazySingleton<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<ProfileLocalDataSource>(
        () => ProfileLocalDataSourceImpl());
    sl.registerLazySingleton<BaseProfileRepository>(
        () => ProfileRepository(sl(), sl()));
    sl.registerLazySingleton(() => GetProfileUserDataUsecase(sl()));
    sl.registerLazySingleton(() => PutProfileUserDataUseCase(sl()));

    // all stations names
    sl.registerLazySingleton<AllStationsNamesLocalDataSource>(
        () => AllStationsNamesLocalDataSourceImpl());
    sl.registerLazySingleton<AllStationsNamesRemoteDataSource>(
        () => AllStationsNamesRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<BaseAllStationsNamesRepository>(
        () => AllStationsNamesRepository(sl(), sl()));
    sl.registerLazySingleton(() => GetAllStationsNamesUseCase(sl()));
  }
}
