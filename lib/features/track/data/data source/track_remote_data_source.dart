// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:traind_app/core/services/api_service.dart';
import 'package:traind_app/features/track/data/models/track_model.dart';
import 'package:traind_app/features/track/domain/entities/track_entity.dart';

abstract class TrackRemoteDataSource {
  Future<TrackEntity> getTrackInfo(String parameters);
}

class TrackRemoteDataSourceImpl extends TrackRemoteDataSource {
  final ApiService apiService;
  TrackRemoteDataSourceImpl(
    this.apiService,
  );

  @override
  Future<TrackEntity> getTrackInfo(String parameters) async {
    var data = await apiService.get(endPoint: '/Ticket/Tracking/$parameters');
    TrackEntity trackEntity = TrackModel.fromJson(data);
    return trackEntity;
  }
}
