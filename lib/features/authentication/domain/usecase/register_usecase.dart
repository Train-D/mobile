import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../data/models/register_request_model.dart';
import '../entities/response_entity.dart';
import '../repository/register_domain_repository.dart';

class PostRegisterDataUseCase extends BaseUsecase<ResponseEntity,RegisterRequestModel>{
  final BaseRegisterRepository baseRegisterRepository;

  PostRegisterDataUseCase(this.baseRegisterRepository);

  @override
  Future<Either<Failure, ResponseEntity>> call(RegisterRequestModel parameters) async{
    return await baseRegisterRepository.postRegisterData(parameters);
  } 
}

