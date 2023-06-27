// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:traind_app/core/network/remote/api_constants.dart';
import 'package:traind_app/core/services/api_service.dart';
import 'package:traind_app/features/tickets/data/models/first%20screen/trip_info_model.dart';
import 'package:traind_app/features/tickets/data/models/second%20screen/train_info_model.dart';
import 'package:traind_app/features/tickets/domain/entities/second%20screen/train_info_entity.dart';

abstract class TrainInfoRemoteDataSource {
  Future<TrainInfoEntity> trainInfo(TripInfoModel model);
}

class TrainInfoRemoteDataSourceImpl extends TrainInfoRemoteDataSource {
  final ApiService apiService;
  TrainInfoRemoteDataSourceImpl(
     this.apiService,
  );

  @override
  Future<TrainInfoEntity> trainInfo(TripInfoModel model) async {
    var data = await apiService.post(
      endPoint: ApiConstants.trainInfoEndPoint,
      data: model.toJson(),
    );

    TrainInfoEntity trainInfoData = TrainInfoModel.fromJson(data);
    return trainInfoData;
  }
}
