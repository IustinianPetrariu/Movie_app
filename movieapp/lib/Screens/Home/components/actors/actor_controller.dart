import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/Screens/Home/components/actors/actor.dart';
import 'package:movieapp/Screens/Home/components/actors/actor_details.dart';

class ActorController extends StatelessWidget {
  final int userId;

  const ActorController({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future getUserData() async {
      // use the type to get the movie data
      var response = await http.get(Uri.http("localhost:8000", "/api/actors"));
      var jsonData = jsonDecode(response.body);
      List<Actor> actors = [];
      for (var result in jsonData) {
        Actor actor = Actor(
            result['name'], result['description'], result['age'], result['id']);
        actors.add(actor);
      }
      print(actors.length);
      return actors;
    }

    // display hello text
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actors'),
      ),
      body: Container(
        child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // cast snapshot data
              List<Actor> actors = snapshot.data as List<Actor>;
              return ListView.builder(
                itemCount: actors.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(actors[index].name),
                      subtitle: Text(actors[index].age.toString()),
                      trailing: const Icon(Icons.arrow_forward_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActorDetails(
                              actor: actors[index],
                              userId: userId,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
