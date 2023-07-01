import 'package:dio/dio.dart';
import 'package:traind_app/features/tickets/data/models/user_valid_booked_tickets_model.dart';
import 'package:traind_app/features/tickets/domain/entities/user_valid_booked_tickets_entity.dart';

import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/network/remote/api_constants.dart';

abstract class UserValidBookedTicketsRemoteDataSource {
  Future<UserValidBookedTicketsEntity> getUserValidBookedTickets();
}

class UserValidBookedTicketsRemoteDataSourceImpl extends UserValidBookedTicketsRemoteDataSource{
   //final ApiService apiService;
  
  UserValidBookedTicketsRemoteDataSourceImpl();
  @override
  Future<UserValidBookedTicketsEntity> getUserValidBookedTickets() async{
     final dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer ${CacheHelper.getData(key: "token")}';
    var response = await dio.get('${ApiConstants.baseUrl}${ApiConstants.userBookedTickets}');
    UserValidBookedTicketsEntity userValidBookedTicketsEntity = UserValidBookedTicketsModel(userValidBookedTickets: List.castFrom(response.data));
    return userValidBookedTicketsEntity;
  }

}
