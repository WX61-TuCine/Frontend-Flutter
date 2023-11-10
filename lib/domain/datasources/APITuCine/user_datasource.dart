import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/domain/entities/user.dart';
import 'package:tu_cine/infrastructure/models/apiTuCine/cineclub_response.dart';

abstract class UserDatasource{
  Future<dynamic> getUserByEmailAndPassword(String email, String password);
  Future<dynamic> createUser(UserPost user);

}