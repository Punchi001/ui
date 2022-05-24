import 'package:flutter/material.dart';

import '../../constants.dart';

class EmailController extends StatelessWidget {
  const EmailController({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: emailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        value = emailController.text;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        contentPadding: EdgeInsets.zero,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: kPrimaryColor,
          ),
        ),
        focusColor: kPrimaryColor,
      ),
    );
  }
}
