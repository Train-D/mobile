import 'package:traind_app/features/tickets/domain/entities/from_to_date_entity.dart';

class FromToDateModel extends FromToDateEntity {
  const FromToDateModel(
      {required super.fromStation,
      required super.toStation,
      required super.date});
  Map<String, dynamic> tojson() {
    return {
      "fromStation": fromStation,
      "toStation": toStation,
      "date": date
    };
  }
}
