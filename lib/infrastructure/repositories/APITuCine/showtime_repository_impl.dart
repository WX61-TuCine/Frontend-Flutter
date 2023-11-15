import 'package:tu_cine/domain/datasources/APITuCine/showtimes_datasource.dart';
import 'package:tu_cine/domain/entities/showtime.dart';
import 'package:tu_cine/domain/repositories/APITuCine/showtimes_repository.dart';

class ShowtimeRepositoryImpl extends ShowtimesRepository {
  final ShowtimesDatasource dataSource;
  ShowtimeRepositoryImpl(this.dataSource);

  @override
  Future<List<Showtime>> getShowtimes(String movieId, String cineclubId) {
    return dataSource.getShowtimes(movieId, cineclubId);
  }
}