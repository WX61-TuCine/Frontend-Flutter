import 'package:dio/dio.dart';
import 'package:tu_cine/domain/datasources/APITuCine/movies_datasource.dart';
import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/infrastructure/mappers/APITuCine/movie_mapper.dart';
import 'package:tu_cine/infrastructure/models/apiTuCine/movie_response.dart';

class MovietucineDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://backend-production-733a.up.railway.app/api/TuCine/v1',
  ));

  List<Movie> _jsonToMovies(List<dynamic> json) {
    final List<Movie> movies = json.map((data) {
      final movieResponse = MovieResponse.fromJson(data);
      return MovieMapper.movieToEntity(movieResponse);
    }).toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await dio.get('/films');

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/films/$id');
    if (response.statusCode != 200) throw Exception('Error al obtener la pelicula');
    
    final movieDetails = MovieResponse.fromJson(response.data);

    final Movie movie = MovieMapper.movieToEntity(movieDetails);

    return movie;
  }
}
