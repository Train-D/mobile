import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/tickets/domain/entities/user_valid_booked_tickets_entity.dart';
import 'package:traind_app/features/tickets/domain/repository/base_user_valid_booked_tickets_repository.dart';

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
