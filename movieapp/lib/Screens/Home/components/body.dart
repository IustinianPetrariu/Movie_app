import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movieapp/Screens/Home/components/background.dart';
import 'package:movieapp/Screens/Home/components/movie_controller.dart';
import 'package:movieapp/components/rounded_button.dart';

class Body extends StatelessWidget {
  final int userId;
  const Body({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Welcome to dashboard',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          RoundedButton(
            text: 'My Movies',
            press: () {},
          ),
          RoundedButton(
            text: 'My Actors',
            press: () {},
          ),
          const Text(
            'Browse through movies and actors',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          RoundedButton(
            text: 'Action',
            press: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieController(
                          userId: userId,
                          type: 'action',
                        )),
              );
            },
          ),
          RoundedButton(
            text: 'Crime',
            press: () {},
          ),
        ],
      ),
    );
  }
}
