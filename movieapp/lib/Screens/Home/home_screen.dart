import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final int userId;
  HomeScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
