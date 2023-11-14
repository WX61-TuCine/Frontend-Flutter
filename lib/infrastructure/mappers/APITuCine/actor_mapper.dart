
import 'package:tu_cine/domain/entities/actor.dart';
import 'package:tu_cine/infrastructure/models/apiTuCine/actors_response.dart';

class ActorMapper {
  //Se coloca como viene en el postman
  static Actor castToEntity(ActorsResponse cast) => Actor(
        id: cast.id,
        firstName: '${cast.firstName} ${cast.lastName}',
        biography: cast.biography,
        profileSrc: cast.profileSrc != null
            ? '${cast.profileSrc}'
            : 'https://qph.cf2.quoracdn.net/main-qimg-6d72b77c81c9841bd98fc806d702e859-lq',
      );
}
