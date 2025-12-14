import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final bool obscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final OutlineInputBorder border;

  const CustomTextField({
    super.key,
    this.hint,
    this.obscure = false,
    this.controller,
    this.validator,
    this.keyboardType,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.hintStyle),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
