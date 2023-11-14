import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/presentation/providers/movies/APITuCine/movies_providers.dart';
//import 'APIMovieDB/movies_providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  
  //final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  final nowPlayingMovies = ref.watch(moviesProvider);

  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 3);
});
