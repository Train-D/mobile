import 'package:traind_app/features/tickets/domain/entities/user_valid_booked_tickets_entity.dart';

class UserValidBookedTicketsModel extends UserValidBookedTicketsEntity {
  UserValidBookedTicketsModel({required super.userValidBookedTickets});
  factory UserValidBookedTicketsModel.fromJson(Map<String, dynamic> json) {
    return UserValidBookedTicketsModel(userValidBookedTickets: json['tickets']);
  }
}
