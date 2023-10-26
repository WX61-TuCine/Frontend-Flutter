import 'package:dio/dio.dart';
import 'package:tu_cine/config/constants/environment.dart';
import 'package:tu_cine/domain/datasources/films_datasource.dart';

import 'package:tu_cine/domain/entities/film.dart';
import 'package:tu_cine/infrastructure/mappers/movie_mapper.dart';
import 'package:tu_cine/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends FilmsDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Film>> getNowPlayingFilms({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');


    //Recibimos un json y lo convertimos a un objeto de dart
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Film> films = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return films;
  }
}