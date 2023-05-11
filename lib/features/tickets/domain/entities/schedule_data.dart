import 'package:equatable/equatable.dart';
import 'package:traind_app/features/tickets/data/models/schedule_model.dart';

// ignore: must_be_immutable
class ScheduleDataEntity extends Equatable {
  List<dynamic> scheduleData;
  ScheduleDataEntity({
    required this.scheduleData,
  });

  @override
  List<Object?> get props => [scheduleData];
  factory ScheduleDataEntity.toEntity(ScheduleModel scheduleModel) {
    return ScheduleDataEntity(scheduleData: scheduleModel.scheduleData);
  }
}
