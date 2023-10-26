import 'package:go_router/go_router.dart';
import 'package:tu_cine/presentation/screens/home/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
      GoRoute(
        path: '/',
        name: HomeScreen.routeName,
        builder: (context,state) => const HomeScreen(),
      )
  ]
  
);
