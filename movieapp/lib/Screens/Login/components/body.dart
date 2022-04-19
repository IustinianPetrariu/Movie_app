import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/Screens/Home/home_screen.dart';
import 'package:movieapp/Screens/Register/register_screen.dart';
import 'package:movieapp/components/already_have_an_account.dart';
import 'package:movieapp/components/rounded_button.dart';
import 'package:movieapp/components/rounded_input_field.dart';
import 'package:movieapp/components/rounded_password_field.dart';
import 'package:movieapp/components/text_field_container.dart';
import 'package:movieapp/constants.dart';
import 'package:http/http.dart' as http;

import 'background.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future handleLogin() async {
      var body = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      var response = await http.post(
          Uri.http("localhost:8000", "/api/users/login"),
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        var json_decode = jsonDecode(response.body);
        var userId = json_decode[0]['id'];
        // print type of userId
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    userId: userId,
                  )),
        );
      } else {
        Scaffold.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Username or password incorrect',
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

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'LOGIN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              'assets/icons/movie-player.svg',
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: emailController,
              hintText: 'Your Email',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'LOGIN',
              press: handleLogin,
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccount(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
