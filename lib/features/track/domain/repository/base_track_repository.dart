import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/track/domain/entities/track_entity.dart';

abstract class BaseTrackRepository {
  Future<Either<Failure, TrackEntity>> getTrackInfo(String ticketId);
}
