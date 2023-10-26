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
    return SizedBox(
        height: 100,
        child: Column(
          children: [
            if (title != null || subtitle != null)
              _Title(title: title, subtitle: subtitle),
          ],
        ));
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {

    const titleStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );

    return Container(
      padding: const EdgeInsets.only(top:10), //Padding entre el titulo y el slider
      margin: const EdgeInsets.symmetric(horizontal: 30), //Para que el texto no quede pegado a los bordes
      child: Row(
        children: [

          if(title !=null)
          Text(title!, style: titleStyle),

          const Spacer(),

          if(subtitle !=null)
            FilledButton.tonal(
              style: const ButtonStyle( visualDensity: VisualDensity.compact),
              onPressed: (){},
              child: Text(subtitle!, style: titleStyle.copyWith(fontSize: 12 , color: const Color(0xffF19F35))),
            )
          

        ],
      )
    );
  }
}
