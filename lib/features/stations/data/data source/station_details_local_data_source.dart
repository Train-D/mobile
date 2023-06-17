import 'dart:convert';

import 'package:traind_app/core/network/local/cache_helper.dart';
import 'package:traind_app/features/stations/data/models/sation_details_model.dart';

import '../../domain/entities/station_details_entity.dart';

abstract class StationDetailsLocalDataSource {
  StationDetailsEntity? getStationDetailsByName(String stationName);
}

class StationDetailsLocalDataSourceImpl extends StationDetailsLocalDataSource {
  @override
  StationDetailsEntity? getStationDetailsByName(String stationName) {
    String? jsonData = CacheHelper.getData(key: stationName);
    if (jsonData == null) return null;
    Map<String, dynamic> jsonDataIs = jsonDecode(jsonData);
    StationDetailsEntity stationDetailsEntity =
        StationDetailsModel.fromJson(jsonDataIs);
        
    return stationDetailsEntity;
  }
}
