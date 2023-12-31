import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/infrastructure/models/moviedb/movie_details.dart';
import 'package:tu_cine/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
        id: moviedb.id,
        title: moviedb.title,
        year: 0,
        synopsis: moviedb.overview,
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        posterSrc: (moviedb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
            : 'noposter',
        //releaseDate: moviedb.releaseDate,
        trailerSrc: '',
        duration: 0,
      );

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
        id: movie.id,
        title: movie.title,
        year: 0,
        synopsis: movie.overview,
        genreIds: movie.genres.map((e) => e.name).toList(),
        posterSrc: (movie.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500/${movie.posterPath}'
            : 'noposter',
        //releaseDate: movie.releaseDate,
        trailerSrc: '',
        duration: 0,
      );
}
