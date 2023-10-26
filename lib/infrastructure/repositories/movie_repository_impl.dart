//Llamar al datasource

import 'package:tu_cine/domain/datasources/movies_datasource.dart';
import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository{

  final MoviesDatasource dataSource;
  MovieRepositoryImpl(this.dataSource);


  @override
  Future<List<Movie>> getNowPlayingFilms({int page = 1}) {
    return dataSource.getNowPlayingFilms(page: page);
  }
 
}