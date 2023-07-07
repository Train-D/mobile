import 'dart:convert';

import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/all_stations_names_entity.dart';
import '../models/all_satations_model.dart';

abstract class AllStationsNamesRemoteDataSource {
  Future<AllStationsNamesEntity> getAllStationsNames();
}

class AllStationsNamesRemoteDataSourceImpl
    extends AllStationsNamesRemoteDataSource {
  final ApiService apiService;

  AllStationsNamesRemoteDataSourceImpl(
    this.apiService,
  );

  @override
  Future<AllStationsNamesEntity> getAllStationsNames() async {
    var data = await apiService.get(
        endPoint: ApiConstants.getAllStationsNamesEndPoint);

    AllStationsNamesEntity allStationsNamesEntity =
        AllStationsNamesModel.fromJson(data);

    storeAllStationsNames(data);

    return allStationsNamesEntity;
  }

  void storeAllStationsNames(Map<String, dynamic> data) {
    String allStationsNames = jsonEncode(data);
    CacheHelper.saveData(key: 'allStationsNames', value: allStationsNames);
  }
}
