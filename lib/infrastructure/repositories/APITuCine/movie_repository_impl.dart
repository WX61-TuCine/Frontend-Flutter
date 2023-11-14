import 'package:tu_cine/domain/datasources/APITuCine/movies_datasource.dart';
import 'package:tu_cine/domain/entities/cineclub.dart';
import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/domain/repositories/APITuCine/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource dataSource;
  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlayingMovies() {
    return dataSource.getNowPlayingMovies();
  }

  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }

  @override
  Future<List<Cineclub>> getCineclubsById(String id) {
    return dataSource.getCineclubsById(id);
  }
}