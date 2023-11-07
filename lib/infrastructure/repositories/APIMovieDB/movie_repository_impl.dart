//Llamar al datasource

import 'package:tu_cine/domain/datasources/APIMovieDB/movies_datasource.dart';
import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/domain/repositories/APIMovieDB/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository{

  final MoviesDatasource dataSource;
  MovieRepositoryImpl(this.dataSource);


  @override
  Future<List<Movie>> getNowPlayingFilms({int page = 1}) {
    return dataSource.getNowPlayingFilms(page: page);
  }
  
  @override
  Future<List<Movie>> getPopularFilms({int page = 1}) {
    return dataSource.getPopularFilms(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcomingFilms({int page = 1}) {
    return dataSource.getUpcomingFilms(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRatedFilms({int page = 1}) {
    return dataSource.getTopRatedFilms(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }
 
}