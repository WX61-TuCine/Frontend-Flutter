import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/infrastructure/models/apiTuCine/movie_response.dart';

class MovieMapper {
  static Movie movieToEntity(MovieResponse movieResponse) => Movie (
    id: movieResponse.id,
    title: movieResponse.title,
    year: movieResponse.year,
    synopsis: movieResponse.synopsis,
    posterSrc: movieResponse.posterSrc,
    genreIds: movieResponse.categories.map((e) => e.toString()).toList(),
    trailerSrc: movieResponse.trailerSrc,
    duration: movieResponse.duration
  );
}
