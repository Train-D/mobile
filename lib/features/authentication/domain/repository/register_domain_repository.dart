import 'package:dartz/dartz.dart';
import '../../data/models/register_request_model.dart';
import '../entities/response_entity.dart';
import '../../../../core/error/failure.dart';

abstract class BaseRegisterRepository{

  Future < Either < Failure, ResponseEntity > > postRegisterData(RegisterRequestModel parameter);

}