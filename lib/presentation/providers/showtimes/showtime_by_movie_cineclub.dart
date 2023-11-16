import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/domain/entities/showtime.dart';
import 'package:tu_cine/presentation/providers/showtimes/showtimes_repository_provider.dart';

final showtimesByMovieCineclubProvider = 
    StateNotifierProvider<ShowtimesByMovieCineclubNotifier, Map<String, List<Showtime>>>(
    (ref) {
    final showtimeRepository = ref.watch(showtimeRepositoryProvider);
    return ShowtimesByMovieCineclubNotifier(
      getShowtimes: showtimeRepository.getShowtimes,
    );
  },
);

typedef GetShowtimesCallBack = Future<List<Showtime>> Function(String movieId, String cineclubId);

class ShowtimesByMovieCineclubNotifier extends StateNotifier<Map<String, List<Showtime>>>{
  final GetShowtimesCallBack getShowtimes;

  ShowtimesByMovieCineclubNotifier({
    required this.getShowtimes,
  }): super({});

  Future<void> loadShowtimes(String movieId, String cineclubId) async {
    if (state[movieId] != null) return; //

    if (state[cineclubId] != null) return; //

    //Aqui se hace la llamada a la api
    final List<Showtime> showtimes = await getShowtimes(movieId, cineclubId);

    //Aqui se guarda en el estado
    state = {...state, '$movieId$cineclubId': showtimes};
  }
}