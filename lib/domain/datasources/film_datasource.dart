import 'package:tu_cine/domain/entities/film.dart';

abstract class FilmDataSource {
  Future<List<Film>> getNowPlayingFilms({int page = 1});
}