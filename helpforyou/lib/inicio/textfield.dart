import 'package:flutter/material.dart';
import 'package:helpforyou/shared/themes/app_colors.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
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

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Color.fromRGBO(172, 176, 234, 1.0),
          borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    Key? key,
    this.hintText,
    this.icon = Icons.lock_outlined,
    this.onChanged,
  }) : super(key: key);

  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autofocus: true,
        onChanged: onChanged,
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color.fromRGBO(63, 71, 206, 1.0),
          ),
          hintText: " Password",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedCPFField extends StatelessWidget {
  const RoundedCPFField({
    Key? key,
    this.hintText,
    this.icon = Icons.streetview_sharp,
    this.onChanged,
  }) : super(key: key);

  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color.fromRGBO(63, 71, 206, 1.0),
          ),
          hintText: " RG",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedNameField extends StatelessWidget {
  const RoundedNameField({
    Key? key,
    this.hintText,
    this.icon = Icons.person_outline,
    this.onChanged,
  }) : super(key: key);

  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autofocus: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color.fromRGBO(63, 71, 206, 1.0),
          ),
          hintText: "Full Name ",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
