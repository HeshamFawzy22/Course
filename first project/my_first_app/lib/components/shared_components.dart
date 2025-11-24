import 'package:flutter/material.dart';

Widget defaultButton({
  required String text,
  required VoidCallback onPressed,
  Color backgroundColor = Colors.teal,
  Color textColor = Colors.white,
  double borderRadius = 8.0,
  double height = 50.0,
  double width = double.infinity,
}) {
  return Container(
    width: width,
    height: height,
    color: backgroundColor,
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    ),
  );
}

Widget defaultTextField({
  required TextEditingController controller,
  required String labelText,
  required TextInputType keyboardType,
  required IconData prefixIcon,
  IconData? suffixIcon,
  VoidCallback? onSuffixIconPressed,
  bool obscureText = false,
  String? Function(String?)? validator,
  
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: Icon(
        prefixIcon,
        color: Colors.grey,
      ),
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: Icon(
                suffixIcon,
                color: Colors.grey,
              ),
              onPressed: onSuffixIconPressed,
            )
          : null,
      labelStyle: TextStyle(
        color: Colors.grey[400],
        fontSize: 12,
      ),
      labelText: labelText,
      border: OutlineInputBorder(),
    ),
    keyboardType: keyboardType,
    obscureText: obscureText,
    validator: validator,
    
  );
}
