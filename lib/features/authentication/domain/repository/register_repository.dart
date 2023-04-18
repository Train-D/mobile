import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class BaseRegisterRepository{

  Future<Either<Failure, bool>>postRegisterData();

}