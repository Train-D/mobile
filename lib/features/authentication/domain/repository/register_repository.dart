import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/authentication/domain/entities/register_entity.dart';

abstract class BaseRegisterRepository{

  Future<Either<Failure, bool>>postRegisterData();

}