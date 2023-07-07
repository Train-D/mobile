// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/authentication/domain/entities/google_sign_in_response_entity.dart';

import '../repository/register_domain_repository.dart';

class GoogleSignInUsecase extends BaseUsecase<GoogleSignInResponseEntity, String> {
  final BaseRegisterRepository baseRegisterRepository;
  GoogleSignInUsecase(
    this.baseRegisterRepository,
  );

  @override
  Future<Either<Failure, GoogleSignInResponseEntity>> call(String parameters) async {
    return await baseRegisterRepository.postGoogeSignInIdToken(parameters);
  }
}
