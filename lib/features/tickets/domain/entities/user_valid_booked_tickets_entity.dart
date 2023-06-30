import 'package:equatable/equatable.dart';

class UserValidBookedTicketsEntity extends Equatable {
  dynamic userValidBookedTickets;
  UserValidBookedTicketsEntity({
    required this.userValidBookedTickets,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [userValidBookedTickets];
}
