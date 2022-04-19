import 'package:flutter/material.dart';
import 'package:movieapp/Screens/Home/components/body.dart';
import 'package:movieapp/components/rounded_button.dart';

class HomeScreen extends StatelessWidget {
  final int userId;
  const HomeScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // display two buttons
      body: Body(
        userId: userId,
      ),
    );
  }
}
