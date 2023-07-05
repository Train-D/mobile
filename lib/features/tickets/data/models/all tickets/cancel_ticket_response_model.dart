import '../../../domain/entities/all tickets/cancel_ticket_response_entity.dart';

class CancelTicketResponseModel extends CancelTicketResponseEntity {
  const CancelTicketResponseModel({
    required super.message,
  });
  factory CancelTicketResponseModel.fromJson(Map<String, dynamic> json) {
    return CancelTicketResponseModel(
      message: json['message'],
    );
  }
}
