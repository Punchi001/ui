import 'package:flutter/material.dart';
import 'package:ui/components/text_field_container.dart';

import '../../constants.dart';

class ConfirmPasswordController extends StatelessWidget {
  const ConfirmPasswordController({
    Key? key,
    required this.confirmPasswordController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        autofocus: false,
        textInputAction: TextInputAction.done,
        controller: confirmPasswordController,
        validator: (value) {
          // if (passwordController.text.length > 8 &&
          //     passwordController.text != value) {
          //   return "Password does not match";
          // }
          // return null;
          if (passwordController.text != confirmPasswordController.text) {
            return "Password does not match";
          }
          return null;
        },
        onSaved: (value) {
          value = confirmPasswordController.text;
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.key_off_rounded,
            color: Colors.purple,
          ),
          hintText: "Confirm your password",
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
