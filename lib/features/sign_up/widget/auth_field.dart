import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String fieldTitle;
  final bool isPasswordField;
  final TextEditingController? controller;
  const AuthField({
    super.key,
    required this.fieldTitle,
    this.isPasswordField = false,
    this.controller,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool _obsecureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPasswordField ? _obsecureText : false,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        enabled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12.5,
        ),
        hintText: widget.fieldTitle,
        hintStyle: const TextStyle(fontSize: 16),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.6),
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: Colors.greenAccent, width: 2),
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  _obsecureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              )
            : null,
      ),
      onEditingComplete: () {
        if (FocusScope.of(context).canRequestFocus) {
          FocusScope.of(context).nextFocus();
        }
      },
    );
  }
}
