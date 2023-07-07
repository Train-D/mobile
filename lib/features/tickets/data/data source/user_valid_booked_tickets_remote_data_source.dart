import 'package:dio/dio.dart';
import 'package:traind_app/features/tickets/data/models/all%20tickets/cancel_payment_request_model.dart';
import '../../domain/entities/all tickets/cancel_payment_request_entity.dart';
import '../../domain/entities/all tickets/cancel_payment_response_entity.dart';
import '../models/all tickets/cancel_payment_response_model.dart';
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
  Future<CancelPaymentResponseEntity> getPaymentId(String ticketId);
  Future<CancelPaymentResponseEntity> returnTicketPrice(
      CancelPaymentRequestModel model);
}

class UserValidBookedTicketsRemoteDataSourceImpl
    extends UserValidBookedTicketsRemoteDataSource {
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
    var data = await apiService.delete(
        endPoint: '${ApiConstants.cancelUserTicket}$ticketId');
    CancelTicketResponseEntity cancelTicketResponseEntity =
        CancelTicketResponseModel.fromJson(data);
    return cancelTicketResponseEntity;
  }

  @override
  Future<CancelPaymentResponseEntity> getPaymentId(String ticketId) async {
    var data = await apiService.get(endPoint: '/Stripe/GetpaymentId/$ticketId');

    CancelPaymentResponseEntity cancelPaymentResponseEntity =
        CancelPaymentResponseModel.fromJson(data);
    return cancelPaymentResponseEntity;
  }

  @override
  Future<CancelPaymentResponseEntity> returnTicketPrice(
      CancelPaymentRequestModel model) async {
    var data = await apiService.post(endPoint: '/Stripe/refund', data: model.toJson());
    CancelPaymentResponseEntity cancelPaymentResponseEntity =
        CancelPaymentResponseModel.fromJson(data);
    return cancelPaymentResponseEntity;    
  }
}
