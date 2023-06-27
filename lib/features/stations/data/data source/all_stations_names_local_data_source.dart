import 'dart:convert';

import '../../../../core/network/local/cache_helper.dart';
import '../models/all_satations_model.dart';
import '../../domain/entities/all_stations_names_entity.dart';

abstract class AllStationsNamesLocalDataSource {
  AllStationsNamesEntity? getAllStationsNames();
}

class AllStationsNamesLocalDataSourceImpl
    extends AllStationsNamesLocalDataSource {
  @override
  AllStationsNamesEntity? getAllStationsNames() {
    String? jsonData = CacheHelper.getData(key: 'allStationsNames');
    if (jsonData == null) return null;
    Map<String, dynamic> jsonDataIs = jsonDecode(jsonData);
    AllStationsNamesEntity allStationsNames =
        AllStationsNamesModel.fromJson(jsonDataIs);
        
    return allStationsNames;
  }
}
