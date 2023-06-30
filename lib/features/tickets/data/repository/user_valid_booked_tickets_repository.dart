import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/domain/entities/user_valid_booked_tickets_entity.dart';
import 'package:traind_app/features/tickets/domain/repository/base_user_valid_booked_tickets_repository.dart';

import '../data source/user_valid_booked_tickets_remote_data_source.dart';

class UserValidBookedTicketsRepository
    extends BaseUserValidBookedTicketsRepository {
  final UserValidBookedTicketsRemoteDataSource
      userValidBookedTicketsRemoteDataSource;

  UserValidBookedTicketsRepository(this.userValidBookedTicketsRemoteDataSource);
  @override
  Future<Either<Failure, UserValidBookedTicketsEntity>>
      getUserValidBookedTickets() async{
    try {
      var userValidTickets = await userValidBookedTicketsRemoteDataSource.getUserValidBookedTickets();
      return Right(userValidTickets);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
