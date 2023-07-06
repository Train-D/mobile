import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:traind_app/features/settings/data/data%20source/change_password_remote_data_source.dart';
import 'package:traind_app/features/settings/data/repository/change_password_repository.dart';
import 'package:traind_app/features/settings/domain/repository/base_change_password_repository.dart';
import 'package:traind_app/features/settings/domain/usecase/change_password_usecase.dart';
import 'package:traind_app/features/tickets/domain/usecase/cancel_ticket_usecase.dart';
import '../../features/authentication/data/data%20source/reset_password_remote_data_source.dart';
import '../../features/tickets/data/data%20source/user_valid_booked_tickets_remote_data_source.dart';
import '../../features/tickets/data/repository/user_valid_booked_tickets_repository.dart';
import '../../features/tickets/domain/repository/base_user_valid_booked_tickets_repository.dart';
import '../../features/tickets/domain/usecase/user_valid_booked_tickets_usecase.dart';
import '../../features/track/data/data%20source/track_remote_data_source.dart';
import '../../features/track/data/data%20source/train_tracking_remote_data_source.dart';
import '../../features/track/data/repository/track_repository.dart';
import '../../features/track/data/repository/train_tracking_respository.dart';
import '../../features/track/domain/repository/base_track_repository.dart';
import '../../features/track/domain/repository/base_train_tracking_repository.dart';
import '../../features/track/domain/usecase/train_tracking_usecase.dart';
import '../../features/authentication/data/repository/reset_password_repository.dart';
import '../../features/authentication/domain/repository/base_reset_password_respository.dart';
import '../../features/authentication/domain/usecase/reset_password_usecase.dart';
import '../../features/track/domain/usecase/get_track_info_usecase.dart';
import 'api_service.dart';
import '../../features/authentication/data/data%20source/login_remote_data_source.dart';
import '../../features/authentication/data/data%20source/register_remote_data_source.dart';
import '../../features/authentication/data/repository/login_repository.dart';
import '../../features/authentication/data/repository/register_data_repository.dart';
import '../../features/authentication/domain/repository/base_login_repository.dart';
import '../../features/authentication/domain/repository/register_domain_repository.dart';
import '../../features/stations/data/all_stations_names_repository.dart';
import '../../features/stations/data/data%20source/all_stations_names_local_data_source.dart';
import '../../features/stations/data/data%20source/station_details_local_data_source.dart';
import '../../features/stations/data/data%20source/station_details_remote_data_source.dart';
import '../../features/stations/data/repository/station_details_repository.dart';
import '../../features/stations/domain/repository/base_all_stations_repository.dart';
import '../../features/stations/domain/repository/base_station_details_repository.dart';
import '../../features/stations/domain/usecase/get_all_stations_names_usecase.dart';
import '../../features/stations/domain/usecase/get_station_details_by_name_usecase.dart';
import '../../features/tickets/data/data%20source/booking_ticket_remote_data_source.dart';
import '../../features/tickets/data/data%20source/trip_times_remote_data_source.dart';
import '../../features/tickets/data/data%20source/fromto_local_data_source.dart';
import '../../features/tickets/data/data%20source/train_info_remote_data_source.dart';
import '../../features/tickets/data/repository/booking_ticket_repository.dart';
import '../../features/tickets/data/repository/trip_times_repository.dart';
import '../../features/tickets/data/repository/train_info_repository.dart';
import '../../features/tickets/domain/repository/base_booking_ticket_repository.dart';
import '../../features/tickets/domain/repository/base_train_info_repository.dart';
import '../../features/tickets/domain/usecase/booking_ticket_usecase.dart';
import '../../features/tickets/domain/usecase/trip_times_usecase.dart.dart';
import '../../features/tickets/domain/repository/base_trip_times_repository.dart';
import '../../features/tickets/domain/usecase/train_info_usecase.dart';

import '../../features/authentication/domain/usecase/login_usecase.dart';
import '../../features/authentication/domain/usecase/register_usecase.dart';
import '../../features/tickets/data/data source/credit_card_remote_data_source.dart';
import '../../features/tickets/data/data source/get_remote_stations_data.dart';
import '../../features/tickets/data/data source/payment_remote_data_source.dart';
import '../../features/tickets/data/repository/credit_card_repository.dart';
import '../../features/tickets/data/repository/payment_repository.dart';
import '../../features/tickets/data/repository/stations_data_repository.dart';
import '../../features/tickets/domain/repository/base_credit_card_repository.dart';
import '../../features/tickets/domain/repository/base_payment_repository.dart';
import '../../features/tickets/domain/repository/base_stations_repository.dart';
import '../../features/tickets/domain/usecase/credit_card_usecase.dart';
import '../../features/tickets/domain/usecase/payment_usecase.dart';
import '../../features/tickets/domain/usecase/stations_usecase.dart';
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
        () => StationsRepository(sl(), sl()));
    sl.registerLazySingleton(() => GetStationsUseCase(sl()));

    //fromto feature
    sl.registerLazySingleton<FromToLocalDataSource>(
        () => FromToLocalDataSourceImpl());
    sl.registerLazySingleton<BaseTripTimesRemoteDataSource>(
        () => TripTimesRemoteDataSource());
    sl.registerLazySingleton<BaseTripTimesRepository>(
        () => TripTimesRepository(sl()));
    sl.registerLazySingleton(() => TripTimesDataUsecase(sl()));

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

    // station details
    sl.registerLazySingleton<StationDetailsLocalDataSource>(
        () => StationDetailsLocalDataSourceImpl());
    sl.registerLazySingleton<StationDetailsRemoteDataSource>(
        () => StationDetailsRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<BaseStationDetailsRepository>(
        () => StationDetailsRepository(sl(), sl()));
    sl.registerLazySingleton(() => GetStationDetailsByNameUseCase(sl()));

    // train info
    sl.registerLazySingleton<TrainInfoRemoteDataSource>(
        () => TrainInfoRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<BaseTrainInfoRepository>(
        () => TrainInfoRepository(sl()));
    sl.registerLazySingleton(() => TrainInfoUseCase(sl()));

    //credit card data
    sl.registerLazySingleton<CreditCardRemoteDataSource>(
        () => CreditCardRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<BaseCreditCardRepository>(
        () => CreditCardRepository(sl()));
    sl.registerLazySingleton(() => CreditCardUseCase(sl()));

    //payment info
    sl.registerLazySingleton<PaymentRemoteDataSource>(
        () => PaymentRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<BasePaymentRepository>(
        () => PaymentRepository(paymentRemoteDataSource: sl()));
    sl.registerLazySingleton(() => PaymentUseCase(basePaymentRepository: sl()));

    //booking ticket info
    sl.registerLazySingleton<BookingTicketRemoteDataSource>(
        () => BookingTicketRemoteDataSourceImpl(apiService: sl()));
    sl.registerLazySingleton<BaseBookingTicketRepository>(
        () => BookingTicketRepository(bookingTicketRemoteDataSource: sl()));
    sl.registerLazySingleton(() => BookingTicketUsecase(sl()));

    //reset password
    sl.registerLazySingleton<ResetPasswordRemoteDataSource>(
        () => ResetPasswordRemoteDataSourceImpl());
    sl.registerLazySingleton<BaseResetPasswordRepository>(
        () => ResetPasswordRepository(resetPasswordRemoteDataSource: sl()));
    sl.registerLazySingleton(
        () => ResetPasswordUseCase(baseResetPasswordRepository: sl()));

    //User Valid Booked Tickets
    sl.registerLazySingleton<UserValidBookedTicketsRemoteDataSource>(
        () => UserValidBookedTicketsRemoteDataSourceImpl(apiService: sl()));
    sl.registerLazySingleton<BaseUserValidBookedTicketsRepository>(
        () => UserValidBookedTicketsRepository(sl()));
    sl.registerLazySingleton(() => UserValidBookedTicketsUseCase(sl()));
    sl.registerLazySingleton(() => CancelTicketUsecase(sl()));

    //track
    sl.registerLazySingleton<TrackRemoteDataSource>(
        () => TrackRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<BaseTrackRepository>(() => TrackRepository(sl()));
    sl.registerLazySingleton(() => GetTrackInfoUsecase(sl()));

    //train tracking
    sl.registerLazySingleton<TrainTrackingRemoteDataSource>(
        () => TrainTrackingRemoteDataSourceImpl(apiService: sl()));
    sl.registerLazySingleton<BaseTrainTrackingRepository>(
        () => TrainTrackingRepository(trackingRemoteDataSource: sl()));
    sl.registerLazySingleton(() => TrainTrackingUseCase(sl()));
    
    //change password
    sl.registerLazySingleton<ChangePasswordRemoteDataSource>(
        () => ChangePasswordRemoteDataSourceImpl(apiService: sl()));
    sl.registerLazySingleton<BaseChangePasswordRepository>(
        () => ChangePasswordRepository(sl()));
    sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));
  }
}
