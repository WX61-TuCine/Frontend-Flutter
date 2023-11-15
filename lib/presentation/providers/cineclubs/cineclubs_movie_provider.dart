import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/domain/entities/cineclub.dart';
import 'package:tu_cine/presentation/providers/movies/APITuCine/movies_repository_provider.dart';

final cineclubsByMovieProvider = StateNotifierProvider<CineclubsByMovieNotifier, Map<String, List<Cineclub>>>((ref) {
  final cineclubsRepository = ref.watch(movieRepositoryProvider);
  return CineclubsByMovieNotifier(
    getCineclubs: cineclubsRepository.getCineclubsById,
  );
});

typedef GetCineclubsCallBack = Future<List<Cineclub>> Function(String movieId);

class CineclubsByMovieNotifier extends StateNotifier<Map<String, List<Cineclub>>> {
  final GetCineclubsCallBack getCineclubs;

  CineclubsByMovieNotifier({
    required this.getCineclubs,
  }) : super({});

  Future<void> loadCineclubs(String movieId) async {
    if (state[movieId] != null) return; //

    //Aqui se hace la llamada a la api
    final List<Cineclub> cineclubs = await getCineclubs(movieId);

    //Aqui se guarda en el estado
    state = {...state, movieId: cineclubs};

  }
}