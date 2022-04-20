import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/Screens/Home/components/movies/movie.dart';
import 'package:movieapp/Screens/Home/components/movies/movie_details.dart';
import 'package:movieapp/Screens/Home/components/my_movies_details.dart';

class MyMovieController extends StatelessWidget {
  final int userId;
  const MyMovieController({
    Key? key,
    required this.userId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future getUserData() async {
      // use the type to get the movie data
      http.Response response;
      response = await http
          .get(Uri.http("localhost:8000", "/api/users/$userId/movies"));

      var jsonData = jsonDecode(response.body);
      List<Movie> movies = [];
      for (var result in jsonData) {
        Movie movie = Movie(result['name'], result['actors'], result['plot'],
            result['year'], result['producers'], result['id']);
        movies.add(movie);
      }
      print(movies.length);
      return movies;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Container(
        child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // cast snapshot data
              List<Movie> movies = snapshot.data as List<Movie>;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(movies[index].name),
                      subtitle: Text(movies[index].year.toString()),
                      trailing: const Icon(Icons.arrow_forward_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyMoviesDetails(
                                    movie: movies[index],
                                    userId: userId,
                                  )),
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
