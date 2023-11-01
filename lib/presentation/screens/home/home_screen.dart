import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/presentation/providers/providers.dart';
import 'package:tu_cine/presentation/widgets/shared/custom_bottom_navigation.dart';
import 'package:tu_cine/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
      );
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

    //Providers
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(

        //Widget que trabaj directamente con scrollview
        slivers: [

          const SliverAppBar(
            //backgroundColor: Colors.white,
            //expandedHeight: 0,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppbar()
            ),
            //pinned: false,
            //snap: false,
            //elevation: 0,
          ),

          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                //const CustomAppbar(),
                MoviesSlideshow(movies: slideShowMovies),

                CineclubHorizontalListview(
                  movies: popularMovies,
                  title: 'Cineclubs',
                  subtitle: 'Ver más',
                  loadNextPage: () => ref
                      .read(popularMoviesProvider.notifier)
                      .loadNextPage(), //Scroll infinitamente
                ),

                CineclubHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Cineclubs',
                  subtitle: 'Ver más',
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(), //Scroll infinitamente
                ),

                CineclubHorizontalListview(
                  movies: upcomingMovies,
                  title: 'Cineclubs',
                  subtitle: 'Ver más',
                  loadNextPage: () => ref
                      .read(upcomingMoviesProvider.notifier)
                      .loadNextPage(), //Scroll infinitamente
                ),                

                CineclubHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Cineclubs',
                  subtitle: 'Ver más',
                  loadNextPage: () => ref
                      .read(topRatedMoviesProvider.notifier)
                      .loadNextPage(), //Scroll infinitamente
                ), 
                const SizedBox(height: 10),
              ],
            );
          }, childCount: 1)),
        ]);
  }
}
