import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/settings/data/model/change_password_model.dart';
import 'package:traind_app/features/settings/domain/entity/change_password_entity.dart';

abstract class BaseChangePasswordRepository {
  Future<Either<Failure, String>> changePasswordData(
      ChangePasswordModel parameters);
}
