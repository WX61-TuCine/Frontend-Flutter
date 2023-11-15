import 'package:flutter/material.dart';

class ShowtimeScreen extends StatelessWidget {
  static const routeName = 'showtime_screen';

  final String movieId;
  final String cineclubId;

  const ShowtimeScreen({
    super.key,
    required this.movieId,
    required this.cineclubId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: $movieId | CineclubID: $cineclubId'),
      )
    );
  }
}
