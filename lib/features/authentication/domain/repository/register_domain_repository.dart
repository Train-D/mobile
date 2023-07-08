import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/google_sign_in_response_model.dart';
import '../../data/models/register_request_model.dart';
import '../entities/response_entity.dart';

abstract class BaseRegisterRepository {
  Future<Either<Failure, ResponseEntity>> postRegisterData(
      RegisterRequestModel parameter);
  Future<Either<Failure, ResponseEntity>> postGoogeSignInIdToken(
      GoogleSignInRequestModel model);
}
