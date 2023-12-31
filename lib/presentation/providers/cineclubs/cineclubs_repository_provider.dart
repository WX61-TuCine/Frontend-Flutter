//Provider de solo lectura para el repositorio de cineclubs
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/infrastructure/datasources/APITuCine/cineclub_datasource.dart';
import 'package:tu_cine/infrastructure/repositories/APITuCine/cineclub_repository_impl.dart';

final cineclubRepositoryProvider = Provider((ref) {

  return CineclubRepositoryImpl(CineclubDatasource());
});
