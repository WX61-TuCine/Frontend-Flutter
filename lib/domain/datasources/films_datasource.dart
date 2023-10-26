import 'package:tu_cine/domain/entities/film.dart';

abstract class FilmsDataSource {
  Future<List<Film>> getNowPlayingFilms({int page = 1});
}