import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/presentation/providers/providers.dart';
import 'package:tu_cine/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return Column(
      children: [

        const CustomAppbar(),

        MoviesSlideshow(movies: slideShowMovies),
        CineclubHorizontalListview(
          movies: nowPlayingMovies,
          title: 'Cineclubs',
          subtitle: 'Ver más',
        )
      ],
    );
  }
}
