import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movieapp/Screens/Home/components/movies/movie.dart';
import 'package:movieapp/components/rounded_button.dart';
import 'package:movieapp/constants.dart';
import 'package:http/http.dart' as http;

class MyMoviesDetails extends StatelessWidget {
  final Movie movie;
  final int userId;
  const MyMoviesDetails({
    Key? key,
    required this.movie,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future handleAddFavoriteMovie(BuildContext context) async {
      //  add favorite movie to the database
      var body = {
        'user_id': userId,
        'movie_id': movie.id,
        'name': movie.name,
        'year': movie.year,
        'plot': movie.plot,
        'producers': movie.producers,
        'actors': movie.actors,
      };
      var response = await http.post(
        Uri.http("localhost:8000", "/api/users-movies"),
        body: jsonEncode(body),
      );
      if (response.statusCode == 201) {
        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Movie added to favorites successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // content:  Text('Email or password incorrect'),
          ),
        );
      } else if (response.statusCode == 409) {
        Scaffold.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Movie already exists',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          // content:  Text('Email or password incorrect'),
        ));
      } else {
        Scaffold.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Something went wrong',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          // content:  Text('Email or password incorrect'),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
      ),
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.movie,
                  size: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(movie.plot,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Actors: " + movie.actors),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Producers: " + movie.producers),
                ),
                RoundedButton(
                  text: 'Remove from favorite',
                  color: kPrimaryLightColor,
                  textColor: Colors.black,
                  press: () {},
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
