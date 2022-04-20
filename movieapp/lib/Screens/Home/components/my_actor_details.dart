import 'package:flutter/material.dart';
import 'package:movieapp/Screens/Home/components/actors/actor.dart';
import 'package:movieapp/components/rounded_button.dart';
import 'package:movieapp/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyActorDetails extends StatelessWidget {
  final Actor actor;
  final int userId;
  const MyActorDetails({
    Key? key,
    required this.actor,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future handleDeleteFavoriteActor(BuildContext context) async {
      //  add favorite movie to the database
      print("here");
      var body = {
        'user_id': userId,
        'actor_id': actor.id,
      };
      // avoid blocking by CORS

      var response = await http.post(
        Uri.http("localhost:8000", "/api/user-actor"),
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Actor removed from favorites successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // content:  Text('Email or password incorrect'),
          ),
        );
      } else if (response.statusCode == 404) {
        Scaffold.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Actor not found in your list',
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
        title: Text(actor.name),
      ),
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.person,
                  size: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    actor.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Age: " + actor.age.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    actor.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                RoundedButton(
                  text: 'Remove from favorite',
                  color: kPrimaryLightColor,
                  textColor: Colors.black,
                  press: () {
                    handleDeleteFavoriteActor(context);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
