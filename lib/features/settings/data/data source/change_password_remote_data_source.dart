import '../../../../core/services/api_service.dart';
import '../model/change_password_model.dart';
import '../../domain/entity/change_password_entity.dart';

import '../../../../core/network/remote/api_constants.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<String> changePasswordInfo(ChangePasswordModel model);
}

class ChangePasswordRemoteDataSourceImpl
    extends ChangePasswordRemoteDataSource {
  final ApiService apiService;
  ChangePasswordRemoteDataSourceImpl({
    required this.apiService,
  });

  @override
  Future<String> changePasswordInfo(ChangePasswordModel model) async {
    var data = await apiService.post(
        endPoint: ApiConstants.ChangePasswordEndPoint, data: model.toJson());
    return data["message"];
  }
}
