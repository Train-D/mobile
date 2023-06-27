import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/login_request_model.dart';
import '../entities/response_entity.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure, ResponseEntity>> postLoginData(
    LoginRequestModel parameter,
  );
}
