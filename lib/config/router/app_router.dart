import 'package:go_router/go_router.dart';
import 'package:tu_cine/presentation/screens/auth/log-in.dart';
import 'package:tu_cine/presentation/screens/home/home_screen.dart';
import 'package:tu_cine/presentation/screens/movies/movie_screen.dart';
import 'package:tu_cine/presentation/screens/movies/test_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.routeName,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
      path: '/movie/:movieId',
      name: MovieScreen.routeName,
      builder: (context, state) {
        final movieId = state.pathParameters['movieId'] ?? '';

        return MovieScreen(movieId: movieId);
      }),

  GoRoute(
    path: '/test/:id',
    name: TestScreen.routeName,
    builder: (context, state) {
    final movieId = state.pathParameters['movieId'] ?? '';

    return TestScreen(movieId: movieId);
    })
]);
