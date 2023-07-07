import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/register_request_model.dart';
import '../entities/google_sign_in_response_entity.dart';
import '../entities/response_entity.dart';

abstract class BaseRegisterRepository {
  Future<Either<Failure, ResponseEntity>> postRegisterData(
      RegisterRequestModel parameter);
  Future<Either<Failure, GoogleSignInResponseEntity>> postGoogeSignInIdToken(
      String idToken);
}
