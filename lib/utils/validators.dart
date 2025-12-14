import 'dart:core';

class Validators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) return 'هذا الحقل مطلوب';
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'البريد الإلكتروني مطلوب';
    if (!value.contains('@') || !value.contains('.'))
      return 'أدخل بريدًا إلكترونيًا صحيحًا';
    return null;
  }

  static String? number(String? value) {
    if (value == null || value.trim().isEmpty) return 'هذا الحقل مطلوب';
    if (double.tryParse(value.trim()) == null) return 'يجب إدخال رقم صحيح';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) return 'كلمة المرور مطلوبة';
    if (value.trim().length < 6)
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    return null;
  }
}
