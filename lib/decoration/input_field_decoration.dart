import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

InputDecoration textFieldInputDecoration(
  BuildContext context, {
  Widget? counter,
  Widget? prefixIcon,
  String? labelText,
  String? hintText,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    
    prefixIcon: prefixIcon,
    labelText: labelText,
    counter: counter,
    hintText: hintText,
    fillColor: Theme.of(context).iconTheme.color,
    iconColor: Theme.of(context).iconTheme.color!,
    focusColor: Theme.of(context).iconTheme.color,
    labelStyle: Theme.of(context).textTheme.bodyLarge,
    prefixStyle: Theme.of(context).textTheme.bodyLarge,
    suffixStyle: Theme.of(context).textTheme.bodyLarge,
    counterStyle: Theme.of(context).textTheme.bodyLarge,
    helperStyle: Theme.of(context).textTheme.bodyLarge,
    hintStyle: Theme.of(context).textTheme.bodyLarge,
    errorStyle: GoogleFonts.poppins(
      color: Colors.redAccent,
      fontWeight: FontWeight.w600,
    ),
    floatingLabelStyle: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.primary,
    ),
    contentPadding: const EdgeInsets.only(left: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 2.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.redAccent,
        width: 1.5,
      ),
    ),
  );
}
