import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movieapp/Screens/Home/components/actor_controller.dart';
import 'package:movieapp/Screens/Home/components/background.dart';
import 'package:movieapp/Screens/Home/components/movie_controller.dart';
import 'package:movieapp/components/rounded_button.dart';
import 'package:movieapp/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to dashboard',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: 'My Movies',
              press: () {},
            ),
            RoundedButton(
              text: 'My Actors',
              press: () {},
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/movie-player.svg",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.05),
            const Text(
              'Browse through movies and actors',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            RoundedButton(
              text: 'All movies',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieController(
                            userId: userId,
                            type: 'all',
                          )),
                );
              },
            ),
            RoundedButton(
              text: 'Action',
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieController(
                            userId: userId,
                            type: 'Action',
                          )),
                );
              },
            ),
            RoundedButton(
              text: 'Crime',
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieController(
                            userId: userId,
                            type: 'Crime',
                          )),
                );
              },
            ),
            RoundedButton(
              text: 'Animation',
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieController(
                            userId: userId,
                            type: 'Animation',
                          )),
                );
              },
            ),
            RoundedButton(
              text: 'Actors',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActorController(
                            userId: userId,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
