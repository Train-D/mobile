import 'package:dartz/dartz.dart';
import 'package:traind_app/features/authentication/data/models/register_request_model.dart';
import 'package:traind_app/features/authentication/domain/entities/response_entity.dart';
import '../../../../core/error/failure.dart';

abstract class BaseRegisterRepository{

  Future < Either < Failure, ResponseEntity > > postRegisterData(RegisterRequestModel parameter);

}