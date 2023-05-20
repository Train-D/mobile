import 'package:get_it/get_it.dart';
import 'package:traind_app/features/authentication/data/data%20source/login_remote_data_source.dart';
import 'package:traind_app/features/authentication/data/data%20source/register_remote_data_source.dart';
import 'package:traind_app/features/authentication/data/repository/login_repository.dart';
import 'package:traind_app/features/authentication/data/repository/register_data_repository.dart';
import 'package:traind_app/features/authentication/domain/repository/base_login_repository.dart';
import 'package:traind_app/features/authentication/domain/repository/register_domain_repository.dart';
import 'package:traind_app/features/authentication/domain/usecase/login_usecase.dart';
import 'package:traind_app/features/authentication/domain/usecase/register_usecase.dart';
import 'package:traind_app/features/profile/data/data%20source/get_remote_user_profile_data.dart';
import 'package:traind_app/features/profile/data/repository/user_profile_data_repositorty.dart';
import 'package:traind_app/features/profile/domain/repository/base_user_profile_data_repository.dart';
import 'package:traind_app/features/profile/domain/usecase/user_profile_data_usecase.dart';
import 'package:traind_app/features/tickets/data/data%20source/get_remote_stations_data.dart';
import 'package:traind_app/features/tickets/data/repository/get_stations_data_repository.dart';
import 'package:traind_app/features/tickets/domain/repository/get_stations_repository.dart';
import 'package:traind_app/features/tickets/domain/usecase/get_stations_usecase.dart';
import 'package:traind_app/features/tickets/data/data%20source/fromto_data_sorce.dart';
import 'package:traind_app/features/tickets/data/repository/fromto_repository.dart';
import 'package:traind_app/features/tickets/domain/fromto_usecase.dart.dart';
import 'package:traind_app/features/tickets/domain/repository/fromto_domain_repository.dart';

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

    //profile
     sl.registerLazySingleton<BaseGetRemoteUserProfileDataSource>(
        () => GetRemoteUserProfileDataSource());
    sl.registerLazySingleton<BaseUserProfileDataRepository>(
        () => UserProfileDataRepository(sl()));
    sl.registerLazySingleton(() => GetUserProfileDataUseCase(sl()));

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
    /*sl.registerLazySingleton(
        () => RegisterResponseModel(token: sl(), message: sl()));*/
  }
}
