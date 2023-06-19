import 'dart:convert';

import 'package:traind_app/features/tickets/data/models/stations_model.dart';

import '../../../../core/network/local/cache_helper.dart';
import '../../domain/entities/stations_entity.dart';

abstract class FromToLocalDataSource {
  StationsEntity? getFromToStations();
}

class FromToLocalDataSourceImpl extends FromToLocalDataSource{
  @override
  StationsEntity? getFromToStations() {
    String? jsonData = CacheHelper.getData(key: 'fromToStations');
    if (jsonData == null) return null;
    Map<String, dynamic> jsonDataIs = jsonDecode(jsonData);
    StationsEntity fromToStations =
        StationsModel.fromJson(jsonDataIs);
        
    return fromToStations;
  }

}
