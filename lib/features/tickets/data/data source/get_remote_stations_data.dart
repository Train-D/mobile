import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:traind_app/core/network/remote/api_constants.dart';
import 'package:traind_app/features/tickets/data/models/stations_model.dart';
import 'package:traind_app/features/tickets/domain/entities/stations_entity.dart';

import '../../../../core/network/local/cache_helper.dart';

abstract class BaseGetRemoteStationsDataSource {
  Future<StationsEntity> getStationsData();
}

class GetRemoteStationsDataSource extends BaseGetRemoteStationsDataSource {
  @override
  Future<StationsEntity> getStationsData() async {
    try {
      final dio = Dio();
      final response = await dio.get(ApiConstants.fromToStationsPath);
      var temp = StationsModel.fromJson(response.data);
      var stationsEntity = StationsEntity.toEntity(temp);
      //storeFromToStations(temp);
      return stationsEntity;
    } catch (e) {
      throw Exception('Failed to get stations data: $e');
    }
  }

  void storeFromToStations(StationsModel data) {
    String fromToStations = jsonEncode(data);
    CacheHelper.saveData(key: 'fromToStations', value: fromToStations);
  }
}
