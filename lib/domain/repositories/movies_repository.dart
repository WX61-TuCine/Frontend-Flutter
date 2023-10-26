import 'package:tu_cine/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlayingFilms({int page = 1});
}