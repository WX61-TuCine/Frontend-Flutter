import 'package:flutter/material.dart';
import 'package:tu_cine/domain/entities/movie.dart';

class CineclubHorizontalListview extends StatelessWidget {
  //Los cineclubs que quiere mostrar
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage; //Scroll infinitamente

  const CineclubHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
