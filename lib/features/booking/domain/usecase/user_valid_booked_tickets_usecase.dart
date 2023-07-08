import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/all%20tickets/user_valid_booked_tickets_entity.dart';
import '../repository/base_user_valid_booked_tickets_repository.dart';

class UserValidBookedTicketsUseCase
    extends BaseUsecase<UserValidBookedTicketsEntity, NoParameters> {
  final BaseUserValidBookedTicketsRepository
      baseUserValidBookedTicketsRepository;

  UserValidBookedTicketsUseCase(this.baseUserValidBookedTicketsRepository);
  @override
  Future<Either<Failure, UserValidBookedTicketsEntity>> call(
      NoParameters parameters) async{
    return await baseUserValidBookedTicketsRepository.getUserValidBookedTickets();
  }
}
