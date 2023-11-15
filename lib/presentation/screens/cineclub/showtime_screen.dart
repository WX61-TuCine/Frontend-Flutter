import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine/domain/entities/cineclub.dart';
import 'package:tu_cine/domain/entities/movie.dart';
import 'package:tu_cine/domain/entities/showtime.dart';
import 'package:tu_cine/presentation/providers/cineclubs/cineclub_info_provider.dart';
import 'package:tu_cine/presentation/providers/movies/APITuCine/movie_info_provider.dart';
import 'package:tu_cine/presentation/providers/showtimes/showtime_by_movie_cineclub.dart';

class ShowtimeScreen extends ConsumerStatefulWidget {
  static const routeName = 'showtime_screen';

  final String movieId;
  final String cineclubId;

  const ShowtimeScreen({
    super.key,
    required this.movieId,
    required this.cineclubId,
  });

  @override
  ShowtimeScreenState createState() => ShowtimeScreenState();
}

class ShowtimeScreenState extends ConsumerState<ShowtimeScreen> {
  @override
  void initState() {
    super.initState();

    //Aqui se llama al provider
    ref.read(showtimesByMovieCineclubProvider.notifier).loadShowtimes(widget.movieId, widget.cineclubId);
    ref.read(cineclubInfoProvider.notifier).loadCineclub(widget.cineclubId);
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {

    final cineclub = ref.watch(cineclubInfoProvider)[widget.cineclubId];
    final movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (cineclub == null) {
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
              title: ShowtimeAppBar(),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                _MovieDetails(movie: movie),
                const SizedBox(height: 10),
                _CineclubDetails(cineclub: cineclub), 
                const SizedBox(height: 10),
                //_ShowtimeList(movie: movie, cineclub: cineclub),               
              ],
            );
          }, childCount: 1))
        ],
      ),
    );
  }
}






class _MovieDetails extends StatelessWidget {

  final Movie movie;

  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Película',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.start,
              ),

              const SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                  color: const Color(0xFFFFF7C2), // Color de fondo
                  borderRadius: BorderRadius.circular(10), // Ajusta el radio de borde según lo necesites
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        movie.posterSrc,
                        width: 40,
                        
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) return const SizedBox();
                          return FadeIn(child: child);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            movie.title,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(height: 3),
              
                      Padding(                      
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          movie.genreIds.join(', '), // Une los géneros con ', '
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ),
      ],
    );
  }
}

class _CineclubDetails extends StatelessWidget {

  final Cineclub cineclub;
  
  const _CineclubDetails({required this.cineclub});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children:[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cineclub.name,
                          style: titleStyle.titleMedium,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            const Icon(Icons.location_pin, color: Colors.black, size: 15),
                            const SizedBox(width: 3),
                            Text(
                              cineclub.address,
                              style: titleStyle.bodyMedium,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
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
                      'Ver más',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ]
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cineclub.bannerSrc,
                  width: size.width * 0.95,
                  height: 150,
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
        

      ],
    );
  }
}

class ShowtimeAppBar extends StatelessWidget {
  const ShowtimeAppBar({super.key});

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
                    'Escoge un horario',
                    style: titleStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )));
  }
}
