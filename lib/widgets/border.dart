import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

// use with Buttons, Cards, Containers
class AppBorder {
  static RoundedRectangleBorder rounded() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(
        color: AppColors.gold,
        width: 1.5,
        style: BorderStyle.solid,
      ),
    );
  }
}

// use with TextField
class TextFieldBorder {
  static OutlineInputBorder input() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: AppColors.gold,
        width: 2,
        style: BorderStyle.solid,
      ),
    );
  }
}
