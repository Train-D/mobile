import '../../../domain/entities/all%20tickets/user_valid_booked_tickets_entity.dart';

class UserValidBookedTicketsModel extends UserValidBookedTicketsEntity {
  UserValidBookedTicketsModel({required super.userValidBookedTickets});
  factory UserValidBookedTicketsModel.fromJson(Map<String, dynamic> json) {
    return UserValidBookedTicketsModel(userValidBookedTickets: json['tickets']);
  }
}
