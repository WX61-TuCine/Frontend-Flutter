//Para cache

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/presentation/providers/movies/movies_repository_provider.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier,Map<String, Movie>> ((ref) {
  final getMovie = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(
    getMovie: getMovie.getMovieById,
  );
});


typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return; //

    //Aqui se hace la llamada a la api
    final movie = await getMovie(movieId);

    //Aqui se guarda en el estado
    state = {...state, movieId: movie};

  }
}
