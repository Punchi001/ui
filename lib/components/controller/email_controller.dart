import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ui/components/text_field_container.dart';

import '../../constants.dart';

class EmailController extends StatelessWidget {
  const EmailController({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autofocus: false,
        controller: emailController,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter your email");
          }
          final bool isValid = EmailValidator.validate(value);
          if (!isValid) {
            return "Invalid email address";
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
      ),
    );
  }
}
