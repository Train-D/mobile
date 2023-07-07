part of 'userValidBookedTickets_cubit.dart';

abstract class UserValidBookedTicketsState{}

class UserValidBookedTicketsInitial extends UserValidBookedTicketsState {}

class UserValidBookedTicketsLoadingState extends UserValidBookedTicketsState{}
class UserValidBookedTicketsSuccessState extends UserValidBookedTicketsState{}
class UserValidBookedTicketsFailureState extends UserValidBookedTicketsState{}

class CancelUserTicketLoadingState extends UserValidBookedTicketsState {}
class CancelUserTicketSuccessState extends UserValidBookedTicketsState {}
class CancelUserTicketFailureState extends UserValidBookedTicketsState {}

class GetPaymentIdLoadingState extends UserValidBookedTicketsState {}
class GetPaymentIdSuccessState extends UserValidBookedTicketsState {}
class GetPaymentIdFailureState extends UserValidBookedTicketsState {}

class ReturnTicketPriceToUserLoadingState extends UserValidBookedTicketsState {}
class ReturnTicketPriceToUserSuccessState extends UserValidBookedTicketsState {}
class ReturnTicketPriceToUserFailureState extends UserValidBookedTicketsState {}




