import 'package:dio/dio.dart';
import 'package:tu_cine/domain/datasources/APITuCine/user_datasource.dart';
import 'package:tu_cine/infrastructure/mappers/APITuCine/user_mapper.dart';

import '../../../domain/entities/user.dart';
import '../../models/apiTuCine/cineclub_response.dart';

class userTuCineDataSource extends UserDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://backend-production-733a.up.railway.app/api/TuCine/v1',
  ));

  List<User> _jsonToUsers(List<dynamic> json) {
    final List<User> users = json.map((data) {
      final userResponse = UserResponse.fromJson(data);
      return UserMapper.UserToEntity(userResponse);
    }).toList();

    return users;
  }

  @override
  Future<dynamic> getUserByEmailAndPassword(String email, String password) async {
    try {
      var user = await dio.post("/users/auth/sign-in",
          data: {"email": email, "password": password});
      return UserResponse.fromJson(user.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
      return null;
    }
  }

  @override
  Future<dynamic> createUser(UserPost user) async {
    try{
      //var userResponse = dio.post("/users/auth/sign-up", data: user.toJson());
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
      return false;
    }
    return true;
  }
}
