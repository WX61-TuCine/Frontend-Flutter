
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/infrastructure/datasources/movietucine_datasource.dart';
import 'package:tu_cine/infrastructure/repositories/APITuCine/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovietucineDatasource());
});