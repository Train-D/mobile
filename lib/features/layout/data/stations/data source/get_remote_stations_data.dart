import 'package:dio/dio.dart';
import 'package:traind_app/core/network/api_constants.dart';
import 'package:traind_app/features/layout/data/stations/models/stations_model.dart';
import 'package:traind_app/features/layout/domain/stations/entity/stations_entity.dart';

abstract class BaseGetRemoteStationsDataSource {

  Future<StationsEntity> getStationsData();
}

class GetRemoteStationsDataSource extends BaseGetRemoteStationsDataSource {

  @override
  Future<StationsEntity> getStationsData() async {
    try {
      final dio = Dio();
      final response = await dio.get(
        ApiConstants.fromToStationsPath
      );
      var temp = StationsModel.fromjson(response.data);
      var stationsEntity = StationsEntity.toEntity(temp);
      return stationsEntity;
    } catch (e) {
      throw Exception('Failed to get stations data: $e');
    }
  }
}
