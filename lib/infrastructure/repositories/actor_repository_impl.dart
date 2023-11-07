
import 'package:tu_cine/domain/datasources/actors_datasource.dart';
import 'package:tu_cine/domain/entities/actor.dart';
import 'package:tu_cine/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDataSource dataSource;
  ActorRepositoryImpl(this.dataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return dataSource.getActorsByMovie(movieId);
  }
}