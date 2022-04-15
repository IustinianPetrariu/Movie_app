import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/Screens/Home/home_screen.dart';
import 'package:movieapp/Screens/Login/login_screen.dart';
import 'package:movieapp/Screens/Register/components/background.dart';
import 'package:movieapp/components/already_have_an_account.dart';
import 'package:movieapp/components/rounded_button.dart';
import 'package:movieapp/components/rounded_input_field.dart';
import 'package:movieapp/components/rounded_password_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future handleRegister() async {
      var body = {
        'username': userNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      };
      var response = await http.post(
          Uri.http("localhost:8000", "/api/users/register"),
          body: jsonEncode(body));
      if (response.statusCode == 201) {
        var userId = response.body;
        var userIdInt = int.parse(userId);
        print(userId);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    userId: userIdInt,
                  )),
        );
      } else if (response.statusCode == 409) {
        Scaffold.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Email already exists',
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

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "REGISTER",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/movie-player.svg",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: userNameController,
              hintText: "Your Username",
              onChanged: (value) {},
            ),
            RoundedInputField(
              controller: emailController,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "REGISTER",
              press: handleRegister,
            ),
            AlreadyHaveAnAccount(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
