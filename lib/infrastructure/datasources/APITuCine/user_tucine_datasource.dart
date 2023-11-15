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
  Future<dynamic> getUserByEmailAndPassword(
      String email, String password) async {
    try {
      Response user = await dio.post("/users/auth/sign-in",
          data: {"email": email, "password": password});
      return UserResponse.fromJson(user.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error de respuesta de Dio: ${e.response?.data}');
      } else {
        print('Error de solicitud de Dio: ${e.requestOptions.path}');
      }
      return null;
    }
  }

  @override
  Future<dynamic> createUser(UserPost user) async {
    try {
      Response response = await dio.post("/users/auth/sign-up", data: user.toJson());
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
      on DioException catch (e) {
      if (e.response != null) {
        print('Error de respuesta de Dio: ${e.response?.data}');
      } else {
        print('Error de solicitud de Dio: ${e.requestOptions.path}');
      }
      return false;
    }
  }
}
