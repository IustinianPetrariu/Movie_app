import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/components/already_have_an_account.dart';
import 'package:movieapp/components/rounded_button.dart';
import 'package:movieapp/components/rounded_input_field.dart';
import 'package:movieapp/components/rounded_password_field.dart';
import 'package:movieapp/components/text_field_container.dart';
import 'package:movieapp/constants.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
            hintText: 'Your Email',
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: 'LOGIN',
            press: () {},
          ),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccount(
            press: () {},
          ),
        ],
      ),
    );
  }
}
