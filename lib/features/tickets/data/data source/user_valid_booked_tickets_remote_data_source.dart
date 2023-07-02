import 'package:dio/dio.dart';

import 'package:traind_app/features/tickets/data/models/user_valid_booked_tickets_model.dart';
import 'package:traind_app/features/tickets/domain/entities/user_valid_booked_tickets_entity.dart';

import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/services/api_service.dart';

abstract class UserValidBookedTicketsRemoteDataSource {
  Future<UserValidBookedTicketsEntity> getUserValidBookedTickets();
}

class UserValidBookedTicketsRemoteDataSourceImpl
    extends UserValidBookedTicketsRemoteDataSource {
  //final ApiService apiService;
  final ApiService apiService;
  UserValidBookedTicketsRemoteDataSourceImpl({
    required this.apiService,
  });

  @override
  Future<UserValidBookedTicketsEntity> getUserValidBookedTickets() async {
    var data = await apiService.get(endPoint: ApiConstants.userBookedTickets);
    UserValidBookedTicketsEntity userValidBookedTicketsEntity =
        UserValidBookedTicketsModel.fromJson(data);
    return userValidBookedTicketsEntity;
  }
}
