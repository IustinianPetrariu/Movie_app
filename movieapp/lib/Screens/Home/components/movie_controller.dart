import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieController extends StatelessWidget {
  final int userId;
  final String type;

  const MovieController({
    Key? key,
    required this.userId,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future getUserData() async {
      var response = await http.get(Uri.http("localhost:8000", "/api/movies"));
      var jsonData = jsonDecode(response.body);
      List<Movie> movies = [];
      for (var result in jsonData) {
        Movie movie = Movie(result['name'], result['actors'], result['plot']);
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
        child: Card(
          child: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // cast snapshot data
                List<Movie> movies = snapshot.data as List<Movie>;
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(movies[index].name),
                      subtitle: Text(movies[index].plot),
                      trailing: Text(movies[index].actors),
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
      ),
    );
  }
}

class Movie {
  final String name, actors, plot;

  Movie(this.name, this.actors, this.plot);
}
