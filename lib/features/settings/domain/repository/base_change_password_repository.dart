import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/change_password_model.dart';
import '../entity/change_password_entity.dart';

abstract class BaseChangePasswordRepository {
  Future<Either<Failure, String>> changePasswordData(
      ChangePasswordModel parameters);
}
