import 'package:tu_cine/domain/entities/actor.dart';
import 'package:tu_cine/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  //Se coloca como viene en el postman
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        firstName: cast.name,
        biography:
            cast.character != null ? '${cast.character}' : 'No hay información',
        profileSrc: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
            : 'https://qph.cf2.quoracdn.net/main-qimg-6d72b77c81c9841bd98fc806d702e859-lq',
      );
}
