import 'package:traind_app/features/tickets/data/models/fourth%20screen/booking_ticket_model.dart';
import 'package:traind_app/features/tickets/data/models/fourth%20screen/ticket_info_model.dart';
import 'package:traind_app/features/tickets/domain/entities/fourth%20screen/ticket_info_entity.dart';

import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/services/api_service.dart';

abstract class BookingTicketRemoteDataSource {
  Future<TicketInfoEntity> getTicketInfo(BookingTicketModel model);
}

class BookingTicketRemoteDataSourceImpl extends BookingTicketRemoteDataSource {
  final ApiService apiService;
  BookingTicketRemoteDataSourceImpl({
    required this.apiService,
  });
  @override
  Future<TicketInfoEntity> getTicketInfo(BookingTicketModel model) async{
   var data = await apiService.post(
      endPoint: ApiConstants.bookingTicketEndPoint,
      data: model.toJson(),
    );

    TicketInfoEntity ticketInfoEntity = TicketInfoModel.fromJson(data);
    return ticketInfoEntity;
  }

}
