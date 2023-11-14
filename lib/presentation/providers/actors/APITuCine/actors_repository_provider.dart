

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/infrastructure/datasources/APITuCine/actor_datasource.dart';
import 'package:tu_cine/infrastructure/repositories/APITuCine/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorAPITuCineDatasource());
});