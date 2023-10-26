import 'package:tu_cine/domain/entities/film.dart';

abstract class FilmRepository {
  Future<List<Film>> getNowPlayingFilms({int page = 1});
}