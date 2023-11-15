
import 'package:tu_cine/domain/entities/showtime.dart';
import 'package:tu_cine/infrastructure/models/apiTuCine/showtime_response.dart';

class ShowtimeMapper{
  static Showtime showtimeToEntity(ShowtimeResponse showtimeResponse) => 
  Showtime(
    id: showtimeResponse.id,
    playDate: showtimeResponse.playDate,
    playTime: showtimeResponse.playTime,
    capacity: showtimeResponse.capacity,
    unitPrice: showtimeResponse.unitPrice,
  );
}