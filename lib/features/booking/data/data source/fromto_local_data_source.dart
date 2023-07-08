import 'dart:convert';

import '../../../../core/network/local/cache_helper.dart';
import '../../domain/entities/first screen/stations_entity.dart';
import '../models/first%20screen/stations_model.dart';

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
