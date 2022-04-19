import 'package:flutter/material.dart';
import 'package:movieapp/Screens/Home/components/actor.dart';
import 'package:movieapp/components/rounded_button.dart';
import 'package:movieapp/constants.dart';

class ActorDetails extends StatelessWidget {
  final Actor actor;

  const ActorDetails({
    Key? key,
    required this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(actor.name),
      ),
      body: Padding(
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
