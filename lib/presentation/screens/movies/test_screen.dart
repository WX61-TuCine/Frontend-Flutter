import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {

  static const routeName = 'test_screen';

  final String movieId;

  const TestScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: $movieId'),
      ),
    );
  }
}