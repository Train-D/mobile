import 'package:dio/dio.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/network/remote/api_constants.dart';
import 'package:traind_app/core/network/remote/error_message_model.dart';
import 'package:traind_app/features/tickets/data/models/from_to_date_model.dart';
import 'package:traind_app/features/tickets/data/models/trip_times_model.dart';
import 'package:traind_app/features/tickets/domain/entities/trip_times_entity.dart';

abstract class BaseTripTimesRemoteDataSource {
  Future<TripTimesEntity> tripTimesData(FromToDateModel model);
}

class TripTimesRemoteDataSource extends BaseTripTimesRemoteDataSource {
  @override
  Future<TripTimesEntity> tripTimesData(FromToDateModel model) async {
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
      var temp = TripTimesModel.fromjson(response.data);
      var scheduleDataEntity = TripTimesEntity.toEntity(temp);
      return scheduleDataEntity;
    }

    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromText(response.data),
    );
  }
}
