import 'package:dartz/dartz.dart';
import 'package:traind_app/features/authentication/domain/entities/response_entity.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/login_request_model.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure, ResponseEntity>> postLoginData(
    LoginRequestModel parameter,
  );
}
