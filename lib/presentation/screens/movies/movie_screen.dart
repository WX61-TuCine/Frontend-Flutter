import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/presentation/providers/cineclubs/cineclubs_movie_provider.dart';
import 'package:tu_cine/presentation/providers/providers.dart';
import 'package:tu_cine/presentation/widgets/movies/cineclub_listview_movie.dart';
import 'package:drift/drift.dart' as drift;

import '../../../database/moviesDatabase.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const routeName = 'movie_screen';

  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId,
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  late bool _isFavorite = false;

  void navigateToCineclub(String cineclubId) {
    final goRouter = GoRouter.of(context);
    goRouter.push('/movie/${widget.movieId}/cineclubs/$cineclubId');
  }

  @override
  void initState() {
    super.initState();

    //Aqui se llama al provider
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
    ref.read(cineclubsByMovieProvider.notifier).loadCineclubs(widget.movieId);

  }

  verifyFavorite(String movieName) async {
    final database = AppDatabase();
    final favoriteMovie = await database.getFavoriteMovieByName(movieName);
    if (favoriteMovie != null) {
      setState(() {
        _isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Aqui se obtiene la pelicula
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    final cineclubs = ref.watch(cineclubsByMovieProvider)[widget.movieId];

    verifyFavorite(movie!.title);
    // Then in your return statement:
    if (cineclubs == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (movie == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: MovieAppBar(),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                
                _MovieDetails(movie: movie),

                CineclubListviewMovie(
                  cineclubs: cineclubs,
                  movieId: widget.movieId,
                  name: 'Cineclubs',
                  loadNextPage: () => ref
                      .read(cineclubsByMovieProvider.notifier)
                      .loadCineclubs(widget.movieId),
                  onTapCineclub: navigateToCineclub,
                )
                
              ],
            );
          }, childCount: 1))
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _isFavorite = !_isFavorite;
            if (_isFavorite) {
              // Obtén una referencia a la base de datos
              final database = AppDatabase();

              // Crea una instancia de FavoriteMovie
              final favoriteMovie = FavoriteMoviesCompanion(
                id: drift.Value(movie.id),
                title: drift.Value(movie.title),
                year: drift.Value(movie.year),
                synopsis: drift.Value(movie.synopsis),
                genreIds: drift.Value(movie.genreIds.join(',')),
                trailerSrc: drift.Value(movie.trailerSrc),
                duration: drift.Value(movie.duration),
                posterSrc: drift.Value(movie.posterSrc),
              );

              // Inserta la película en la base de datos
              await database.insertFavoriteMovie(favoriteMovie);
            } else {
              // Si el botón se desactiva, puedes eliminar la película de la base de datos
              final database = AppDatabase();
              await database.deleteFavoriteMovie(FavoriteMoviesCompanion(id: drift.Value(movie.id)));
            }

            setState(() {});
          },
          child: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.white,
          ),
        )
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;

  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterSrc,
                  width: size.width * 0.95,
                  height: 204,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) return const SizedBox();
                    return FadeIn(child: child);
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      movie.title,
                      style: titleStyle.titleMedium,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Spacer(),
                  FilledButton.tonal(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffFE0000)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Ver trailer',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),

        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(children: [
              ...movie.genreIds.map((gender) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Chip(
                        label:
                            Text(gender, style: const TextStyle(fontSize: 10)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ))
            ])),

        //const SizedBox(height: 7),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            movie.synopsis,
            style: titleStyle.bodyMedium,
            textAlign: TextAlign.justify,
          ),
        ),

        _ActorsByMovie(movieId: movie.id.toString())
      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {
  final String movieId;

  const _ActorsByMovie({required this.movieId});

  @override
  Widget build(BuildContext context, ref) {
    final actorsByMovie = ref.watch(actorsByMovieProvider);

    if (actorsByMovie[movieId] == null) {
      return const Center(
          child: CircularProgressIndicator(
        strokeWidth: 2,
      ));
    }
    final actors = actorsByMovie[movieId]!;
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: actors.length,
          itemBuilder: (context, index) {
            final actor = actors[index];

            return Container(
                padding: const EdgeInsets.all(8.0),
                width: 135,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Actor photo
                    FadeInRight(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          actor.profileSrc,
                          width: 135,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),
                    //Nombre
                    Text(actor.firstName, maxLines: 2),
                    Text(
                      actor.biography,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ));
          }),
    );
  }
}

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              //width: double.infinity,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Image.asset('assets/logo.png' , width: 30, height: 30),
                  const SizedBox(width: 0),
                  Text(
                    'Seleccionar cineclub',
                    style: titleStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )));
  }
}
