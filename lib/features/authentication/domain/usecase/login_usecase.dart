// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/authentication/data/models/login_request_model.dart';
import 'package:traind_app/features/authentication/domain/repository/base_login_repository.dart';

import '../entities/response_entity.dart';

class PostLoginDataUseCase extends BaseUsecase<ResponseEntity, LoginRequestModel> {
  final BaseLoginRepository baseLoginRepository;
  PostLoginDataUseCase(
    this.baseLoginRepository,
  );

  @override
  Future<Either<Failure, ResponseEntity>> call(LoginRequestModel parameters) async {
    return await baseLoginRepository.postLoginData(parameters);
  }
}
