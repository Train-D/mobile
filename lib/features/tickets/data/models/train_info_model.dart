import 'package:traind_app/features/tickets/data/models/seat_model.dart';
import 'package:traind_app/features/tickets/domain/entities/train_info_entity.dart';

import 'class_model.dart';

class TrainInfoModel extends TrainInfoEntity {
  const TrainInfoModel({
    required super.classes,
    required super.seats,
  });
  factory TrainInfoModel.fromJson(Map<String, dynamic> json) {
    return TrainInfoModel(
      classes: List.from(json['classes']).map((e) => ClassModel.fromJson(e)).toList(),
      seats: json['seats'] == [] ? [] : List.from(json['seats']).map((e) => SeatModel.fromJson(e)).toList(),
    );
  }
}



