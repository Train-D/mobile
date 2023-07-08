import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/network/remote/error_message_model.dart';
import '../models/first%20screen/from_to_date_model.dart';
import '../models/first%20screen/trip_times_model.dart';
import '../../domain/entities/first%20screen/trip_times_entity.dart';

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
