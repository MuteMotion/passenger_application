import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mute_motion_passenger/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.onChanged,
      this.hintText,
      required this.controller,
      this.keyboardType,
      required this.obscureText,
      this.suffix});
  String? hintText;
  Function(String)? onChanged;
  TextEditingController controller;
  TextInputType? keyboardType;
  bool obscureText;
  IconButton? suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      validator: (data) {
        if (data!.isEmpty) {
          return 'This field must not be empty';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: GoogleFonts.comfortaa(
          color: Colors.black.withOpacity(0.65),
          fontSize: 12,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
