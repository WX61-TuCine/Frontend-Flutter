
import 'package:dio/dio.dart';
import 'package:tu_cine/domain/datasources/APITuCine/actors_datasource.dart';
import 'package:tu_cine/domain/entities/actor.dart';
import 'package:tu_cine/infrastructure/mappers/APITuCine/actor_mapper.dart';
import 'package:tu_cine/infrastructure/models/apiTuCine/actors_response.dart';

class ActorAPITuCineDatasource extends ActorsDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://backend-production-733a.up.railway.app/api/TuCine/v1',
  ));

  List<Actor> _jsonToActors(List<dynamic> json) {
    final List<Actor> actors = json.map((data) {
      final actorResponse = ActorsResponse.fromJson(data);
      return ActorMapper.castToEntity(actorResponse);
    }).toList();

    return actors;
  }


  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/films/$movieId/actors');

    return _jsonToActors(response.data);
  }
}