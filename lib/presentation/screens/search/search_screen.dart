import 'package:flutter/material.dart';
import 'package:tu_cine/database/moviesDatabase.dart';

import '../movies/movie_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late AppDatabase database = AppDatabase();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<FavoriteMovie>>(
          future: database.getAllFavoriteMovies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieScreen(movieId: snapshot.data![index].id.toString()),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: snapshot.data![index].posterSrc != null
                            ? Image.network(snapshot.data![index].posterSrc!)
                            : null,
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(snapshot.data![index].genreIds ?? 'No synopsis available'),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        ),
      ),
    );
  }
}