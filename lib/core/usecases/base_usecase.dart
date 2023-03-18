// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class BaseUsecase<T, UseCaseParameters> {
  Future<Either<Failure, T>> call(UseCaseParameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}

class UseCaseParameters extends Equatable {
  final int temp; // remove it

  const UseCaseParameters(this.temp);

  @override
  List<Object?> get props => [id];
}
