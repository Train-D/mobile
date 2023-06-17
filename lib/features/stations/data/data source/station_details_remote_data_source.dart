import 'dart:convert';

import 'package:traind_app/core/network/local/cache_helper.dart';
import 'package:traind_app/core/services/api_service.dart';
import 'package:traind_app/features/stations/data/models/sation_details_model.dart';

import '../../domain/entities/station_details_entity.dart';

abstract class StationDetailsRemoteDataSource {
  Future<StationDetailsEntity> getStationDetailsByName(String stationName);
}

class StationDetailsRemoteDataSourceImpl
    extends StationDetailsRemoteDataSource {
  final ApiService apiService;
  StationDetailsRemoteDataSourceImpl(this.apiService);

  @override
  Future<StationDetailsEntity> getStationDetailsByName(
      String stationName) async {
    var data = await apiService.get(endPoint: '/Stations/$stationName');
    StationDetailsEntity stationDetailsEntity =
        StationDetailsModel.fromJson(data);

    storeStationDetails(data, stationName);

    return stationDetailsEntity;
  }

  void storeStationDetails(Map<String, dynamic> data, String stationName) {
    
    String stationDetails = jsonEncode(data);
    CacheHelper.saveData(key: stationName, value: stationDetails);
  }
}
