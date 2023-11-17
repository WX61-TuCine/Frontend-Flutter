
import 'package:dio/dio.dart';
import 'package:tu_cine/domain/datasources/APITuCine/showtimes_datasource.dart';
import 'package:tu_cine/domain/entities/showtime.dart';
import 'package:tu_cine/infrastructure/mappers/APITuCine/showtime_mapper.dart';
import 'package:tu_cine/infrastructure/models/apiTuCine/showtime_response.dart';

class ShowtimeDatasource extends ShowtimesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://backend-production-733a.up.railway.app/api/TuCine/v1',
  ));

  List<Showtime> _jsonToShowtimes(List<dynamic> json) {
    final List<Showtime> showtimes = json.map((data) {
      final showtimeResponse = ShowtimeResponse.fromJson(data);
      return ShowtimeMapper.showtimeToEntity(showtimeResponse);
    }).toList();

    return showtimes;
  }

  @override
  Future<List<Showtime>> getShowtimes(String movieId, String cineclubId) async {
    final response = await dio.get('/showtimes/$movieId/$cineclubId');

    return _jsonToShowtimes(response.data);
  }
}