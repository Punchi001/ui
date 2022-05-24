import 'package:flutter/material.dart';

import '../../constants.dart';

class FirstNameController extends StatelessWidget {
  const FirstNameController({
    Key? key,
    required this.firstNameController,
  }) : super(key: key);

  final TextEditingController firstNameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: "First Name",
        hintText: "Enter your first name",
        contentPadding: EdgeInsets.zero,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: kPrimaryColor,
          ),
        ),
        focusColor: kPrimaryColor,
      ),
      controller: firstNameController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return "Enter your name";
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter an accurate name\n(Min. 3 characters)");
        }
        return null;
      },
      onChanged: (value) {
        value = firstNameController.text;
      },
    );
  }
}
