// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/features/tickets/data/models/all%20tickets/user_valid_booked_tickets_model.dart';
import 'package:traind_app/features/tickets/domain/usecase/user_valid_booked_tickets_usecase.dart';

import '../../../../../core/usecases/base_usecase.dart';
import '../../../domain/entities/all tickets/cancel_ticket_response_entity.dart';
import '../../../domain/usecase/cancel_ticket_usecase.dart';

part 'userValidBookedTickets_state.dart';

class UserValidBookedTicketsCubit extends Cubit<UserValidBookedTicketsState> {
  UserValidBookedTicketsCubit(
    this.userValidBookedTicketsUseCase,
    this.cancelTicketUsecase,
  ) : super(UserValidBookedTicketsInitial());

  static UserValidBookedTicketsCubit get(context) => BlocProvider.of(context);
  final UserValidBookedTicketsUseCase userValidBookedTicketsUseCase;
  UserValidBookedTicketsModel userValidBookedTicketsModel =
      UserValidBookedTicketsModel(userValidBookedTickets: []);

  Future<void> getUserValidBookedTickets() async {
    emit(UserValidBookedTicketsLoadingState());
    var result = await userValidBookedTicketsUseCase.call(const NoParameters());
    result.fold((failure) {
      debugPrint(failure.toString());
      emit(UserValidBookedTicketsFailureState());
    }, (userValidBookedTickets) {
      //print(userValidBookedTickets);
      userValidBookedTicketsModel = UserValidBookedTicketsModel(
          userValidBookedTickets:
              userValidBookedTickets.userValidBookedTickets);
      print(userValidBookedTicketsModel);
      //assignProfileUserDataToTextFields(userData);
      emit(UserValidBookedTicketsSuccessState());
    });
  }

  CancelTicketUsecase cancelTicketUsecase;
  String cancelResponse = '';
  Future<void> cancelUserTicket(String ticketId) async {
    emit(CancelUserTicketLoadingState());
    var result = await cancelTicketUsecase.call(ticketId);
    result.fold((failure) {
      print(failure.toString());
      emit(CancelUserTicketFailureState());
    }, (cancelResp) {
      cancelResponse = cancelResp.message;
      print(cancelResp.message);
      emit(CancelUserTicketSuccessState());
    });
  }
}
