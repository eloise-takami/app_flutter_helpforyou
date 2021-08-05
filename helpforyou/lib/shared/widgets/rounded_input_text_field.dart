import 'package:flutter/material.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

import 'text_field_container.dart';

class RoundedInputTextField extends StatelessWidget {
  const RoundedInputTextField({
    Key? key,
    this.hintText,
    this.onChanged,
    this.autofocus = false,
    this.obscureText = false,
    this.icon = Icons.email_rounded,
    this.keyboardType = TextInputType.emailAddress,
  }) : super(key: key);

  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autofocus: autofocus,
        keyboardType: keyboardType, //TextInputType.emailAddress,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(
            icon, //Icons.email_rounded,
            color: AppColors.roxo, // Color.fromRGBO(63, 71, 206, 1.0),
          ),

          hintText: hintText, //"E-mail",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
