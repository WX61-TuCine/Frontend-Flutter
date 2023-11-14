import 'package:tu_cine/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlayingMovies();
  Future<Movie> getMovieById(String id);

}