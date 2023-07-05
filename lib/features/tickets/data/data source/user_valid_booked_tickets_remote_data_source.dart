import 'package:dio/dio.dart';
import '../models/all%20tickets/cancel_ticket_response_model.dart';

import '../models/all%20tickets/user_valid_booked_tickets_model.dart';
import '../../domain/entities/all%20tickets/user_valid_booked_tickets_entity.dart';

import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/all tickets/cancel_ticket_response_entity.dart';

abstract class UserValidBookedTicketsRemoteDataSource {
  Future<UserValidBookedTicketsEntity> getUserValidBookedTickets();
  Future<CancelTicketResponseEntity> cancelTicket(String ticketId);
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

  @override
  Future<CancelTicketResponseEntity> cancelTicket(String ticketId) async {
    var data = await apiService.delete(endPoint: '${ApiConstants.cancelUserTicket}$ticketId');
    CancelTicketResponseEntity cancelTicketResponseEntity =
        CancelTicketResponseModel.fromJson(data);
    return cancelTicketResponseEntity;
  }
}
