import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/authentication/domain/repository/register_repository.dart';

import '../../../../core/usecases/base_usecase.dart';

class PostRegisterDataUseCase {
  final BaseRegisterRepository baseRegisterRepository;

  PostRegisterDataUseCase(this.baseRegisterRepository);

  Future<Either<Failure, bool>> call(NoParameters parameters) async{
    return await baseRegisterRepository.postRegisterData();
  } 
}

