import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radios = 10.0,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(radios)),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  TextInputType? type,
  Function? validate,
  required dynamic label,
  TextStyle? style,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,
  VoidCallback? onTap,
  Function? onChange,
  Color colorField = Colors.black54,
  bool isClickable = true,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onTap: onTap,
        onChanged: (value) {
          onChange!(value);
        },
        validator: (value) {
          return validate!(value);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email Address',
          prefixIcon: Icon(
            prefix,
            color: colorField,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              suffixPressed!();
            },
            icon: Icon(suffix),
          ),
        ));
