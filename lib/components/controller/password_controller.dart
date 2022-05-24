import 'package:flutter/material.dart';
import 'package:ui/components/text_field_container.dart';

import '../../constants.dart';

class PasswordController extends StatelessWidget {
  const PasswordController({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        autofocus: false,
        textInputAction: TextInputAction.next,
        controller: passwordController,
        validator: (value) {
          RegExp regex = RegExp(r'^.{8,}$');
          if (value!.isEmpty) {
            return ("Please Enter your password");
          }
          if (!regex.hasMatch(value)) {
            return ("Please Enter valid password\n(Min. 8 characters)");
          }
          return null;
        },
        onSaved: (value) {
          value = passwordController.text;
        },
        decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          contentPadding: EdgeInsets.zero,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: kPrimaryColor,
            ),
          ),
          focusColor: kPrimaryColor,
        ),
      ),
    );
  }
}
