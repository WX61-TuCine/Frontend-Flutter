import 'package:go_router/go_router.dart';
import 'package:tu_cine/presentation/screens/home/home_screen.dart';
import 'package:tu_cine/presentation/screens/movies/movie_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.routeName,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      path: '/movie/:movieId',
      name: MovieScreen.routeName,
      builder: (context, state) {
        final movieId = state.pathParameters['movieId'] ?? '';

        return MovieScreen(movieId: movieId);
      })
]);
