import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/infrastructure/datasources/APITuCine/showtime_datasource.dart';
import 'package:tu_cine/infrastructure/repositories/APITuCine/showtime_repository_impl.dart';

final showtimeRepositoryProvider = Provider((ref) {
  return ShowtimeRepositoryImpl(ShowtimeDatasource());
});