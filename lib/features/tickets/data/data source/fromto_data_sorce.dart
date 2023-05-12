import 'package:dio/dio.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/network/remote/api_constants.dart';
import 'package:traind_app/core/network/remote/error_message_model.dart';
import 'package:traind_app/features/tickets/data/models/from_to_date_model.dart';
import 'package:traind_app/features/tickets/data/models/schedule_model.dart';
import 'package:traind_app/features/tickets/domain/entities/schedule_data.dart';

abstract class BaseFromToDateRemoteDataSource {
  Future<ScheduleDataEntity> postFromToDateData(FromToDateModel model);
}

class FromToDateRemoteDataSource extends BaseFromToDateRemoteDataSource {
  @override
  Future<ScheduleDataEntity> postFromToDateData(FromToDateModel model) async {
    final response = await Dio().post(
      ApiConstants.tripTimesPath,
      data: model.tojson(),
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      var temp = ScheduleModel.fromjson(response.data);
      var scheduleDataEntity = ScheduleDataEntity.toEntity(temp);
      return scheduleDataEntity;
    }

    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromText(response.data),
    );
  }
}
