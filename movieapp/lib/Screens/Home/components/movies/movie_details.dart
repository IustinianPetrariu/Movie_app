import 'package:flutter/material.dart';
import 'package:movieapp/Screens/Home/components/movies/movie.dart';
import 'package:movieapp/components/rounded_button.dart';
import 'package:movieapp/constants.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name),
      ),
      body: Padding(
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
                text: "Add to favorite",
                press: () {},
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
      ),
    );
  }
}
