import 'package:tu_cine/domain/datasources/APITuCine/actors_datasource.dart';
import 'package:tu_cine/domain/entities/actor.dart';
import 'package:tu_cine/domain/repositories/APITuCine/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDataSource dataSource;
  ActorRepositoryImpl(this.dataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return dataSource.getActorsByMovie(movieId);
  }
}