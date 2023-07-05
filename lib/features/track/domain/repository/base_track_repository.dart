import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/track_entity.dart';

abstract class BaseTrackRepository {
  Future<Either<Failure, TrackEntity>> getTrackInfo(String ticketId);
}
