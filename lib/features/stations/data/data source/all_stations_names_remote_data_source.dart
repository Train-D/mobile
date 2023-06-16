import 'dart:convert';
import 'package:traind_app/core/network/local/cache_helper.dart';
import 'package:traind_app/core/network/remote/api_constants.dart';
import 'package:traind_app/core/services/api_service.dart';
import 'package:traind_app/features/stations/data/models/all_satations_model.dart';
import 'package:traind_app/features/stations/domain/entities/all_stations_names_entity.dart';

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
