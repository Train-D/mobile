import 'package:traind_app/features/tickets/domain/entities/schedule_data.dart';

class ScheduleModel extends ScheduleDataEntity{
  ScheduleModel({required super.scheduleData});
  factory ScheduleModel.fromjson(List<dynamic> res) {
    return ScheduleModel(scheduleData: res);
  }
}