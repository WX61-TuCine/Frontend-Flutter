import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/infrastructure/datasources/APIMovieDB/moviedb_datasource.dart';
import 'package:tu_cine/infrastructure/repositories/APIMovieDB/movie_repository_impl.dart';


//Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {

  return MovieRepositoryImpl(MoviedbDatasource());
});
