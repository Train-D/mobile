// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/track/data/data%20source/track_remote_data_source.dart';
import 'package:traind_app/features/track/domain/entities/track_entity.dart';
import 'package:traind_app/features/track/domain/repository/base_track_repository.dart';

class TrackRepository extends BaseTrackRepository {
  final TrackRemoteDataSource trackRemoteDataSource;
  TrackRepository(
    this.trackRemoteDataSource,
  );

  @override
  Future<Either<Failure, TrackEntity>> getTrackInfo(String ticketId) async {
    try {
      TrackEntity trackEntity =
          await trackRemoteDataSource.getTrackInfo(ticketId);
      return Right(trackEntity);
    }on DioError catch (e) {
      return Left(ServerFailure(e.response!.data['message'].toString()));
    }
  }
}
