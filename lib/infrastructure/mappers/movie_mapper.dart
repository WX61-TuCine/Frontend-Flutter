import 'package:tu_cine/domain/entities/film.dart';
import 'package:tu_cine/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Film movieDBToEntity (MovieMovieDB moviedb) => Film(
    id: moviedb.id,
    title: moviedb.title,
    synopsis: moviedb.overview,
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    posterSrc: (moviedb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
      : 'noposter',
    releaseDate: moviedb.releaseDate,
  );
}