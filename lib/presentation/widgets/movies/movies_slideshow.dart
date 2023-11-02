import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:tu_cine/domain/entities/movie.dart';

class MoviesSlideshow extends StatefulWidget {
  final List<Movie> movies;

  const MoviesSlideshow({Key? key, required this.movies}) : super(key: key);

  @override
  _MoviesSlideshowState createState() => _MoviesSlideshowState();
}

class _MoviesSlideshowState extends State<MoviesSlideshow> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 349,
          width: double.infinity,
          child: Swiper(
            viewportFraction: 0.8,
            scale: 0.9,
            autoplay: true,
            pagination: const SwiperPagination(
              margin: EdgeInsets.only(top: 0),
              builder: DotSwiperPaginationBuilder(
                activeColor: Color(0xffF19F35),
                color: Colors.grey,
              ),
            ),
            itemCount: widget.movies.length,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
              return _Slide(movie: movie);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.movies[_currentIndex].title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 10)),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.posterSrc,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12),
                );
              }
              return FadeIn(child: child);
            },
          ),
        ),
      ),
    );
  }
}
