import 'package:flutter/material.dart';
import 'package:ui/components/text_field_container.dart';

import '../../constants.dart';

class LastNameController extends StatelessWidget {
  const LastNameController({
    Key? key,
    required this.lastNameController,
  }) : super(key: key);

  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: "Last Name",
          hintText: "Enter your Last name",
          contentPadding: EdgeInsets.zero,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: kPrimaryColor,
            ),
          ),
          focusColor: kPrimaryColor,
        ),
        controller: lastNameController,
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
          value = lastNameController.text;
        },
      ),
    );
  }
}
