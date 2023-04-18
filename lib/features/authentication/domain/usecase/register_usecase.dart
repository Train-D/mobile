import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repository/register_repository.dart';

import '../../../../core/usecases/base_usecase.dart';

class PostRegisterDataUseCase {
  final BaseRegisterRepository baseRegisterRepository;

  PostRegisterDataUseCase(this.baseRegisterRepository);

  Future<Either<Failure, bool>> call(NoParameters parameters) async{
    return await baseRegisterRepository.postRegisterData();
  } 
}

