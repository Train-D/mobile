import 'package:traind_app/features/tickets/domain/entities/schedule_data.dart';

// ignore: must_be_immutable
class ScheduleModel extends ScheduleDataEntity{
  ScheduleModel({required super.scheduleData});
  factory ScheduleModel.fromjson(List<dynamic> res) {
    return ScheduleModel(scheduleData: res);
  }
}