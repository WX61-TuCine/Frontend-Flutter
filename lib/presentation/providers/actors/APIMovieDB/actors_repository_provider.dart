//Este repositorio es inmutable

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/infrastructure/datasources/APIMovieDB/actor_moviedb_datasource.dart';
import 'package:tu_cine/infrastructure/repositories/APIMovieDB/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
