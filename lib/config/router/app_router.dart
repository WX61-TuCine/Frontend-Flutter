import 'package:go_router/go_router.dart';
import 'package:tu_cine/presentation/screens/auth/log-in.dart';
import 'package:tu_cine/presentation/screens/cineclub/showtime_screen.dart';
import 'package:tu_cine/presentation/screens/home/home_screen.dart';
import 'package:tu_cine/presentation/screens/movies/movie_screen.dart';
import 'package:tu_cine/presentation/screens/tickets/my_tickets_screen.dart';


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
      }
      ),

  GoRoute(
    path: '/tickets',
    name: MyTicketsScreen.routeName,
    builder: (context, state) =>const MyTicketsScreen(),
  ),

  GoRoute(
    path: '/movie/:movieId/cineclubs/:cineclubId', 
    name: ShowtimeScreen.routeName, 
    builder: (context, state) {
      final movieId = state.pathParameters['movieId'] ?? '';
      final cineclubId = state.pathParameters['cineclubId'] ?? '';  

      return ShowtimeScreen(movieId: movieId, cineclubId: cineclubId);
    }
  
  
  )
  

]);
