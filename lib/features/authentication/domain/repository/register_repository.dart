import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';

abstract class BaseRegisterRepository{

  Future<Either<Failure, bool>>postRegisterData();

}