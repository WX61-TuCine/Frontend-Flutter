import 'package:tu_cine/domain/entities/cineclub.dart';
import 'package:tu_cine/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlayingMovies();
  Future<Movie> getMovieById(String id);
  Future<List<Cineclub>> getCineclubsById(String id);

}