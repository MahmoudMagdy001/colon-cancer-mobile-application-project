// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class customTextFormField extends StatelessWidget {
  final TextInputType type;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final String label;
  final int? maxlines;
  final IconData? prefix;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final Function()? onTap;
  final IconData? suffix;
  final Function()? suffixpressed;
  final bool isPassword;
  final bool readOnly;
  final FontWeight? fontWeight;
  final Color? labelcolor;
  final Color? prefixcolor;
  final double? labelsize;
  final String? suffixlabel;
  final List<TextInputFormatter>? inputFormatters;
  InputBorder? border;
  InputBorder? focusedBorder;

  customTextFormField({
    Key? key,
    required this.type,
    required this.validator,
    required this.controller,
    required this.label,
    this.prefix,
    this.border = const OutlineInputBorder(),
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.maxlines,
    this.suffix,
    this.suffixpressed,
    this.isPassword = false,
    this.readOnly = false,
    this.fontWeight,
    this.labelcolor,
    this.prefixcolor,
    this.labelsize,
    this.suffixlabel,
    this.focusedBorder,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validator,
      maxLines: maxlines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        focusedBorder: focusedBorder,
        suffixText: suffixlabel,
        prefixIconColor: prefixcolor,
        border: border,
        labelText: label,
        labelStyle: TextStyle(
            fontWeight: fontWeight, color: labelcolor, fontSize: labelsize),
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
          onPressed: suffixpressed,
          icon: Icon(suffix),
        ),
      ),
    );
  }
}
