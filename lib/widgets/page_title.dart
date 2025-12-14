import 'package:first_flutter_application/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class PageTitle extends StatelessWidget {
  final String text;

  const PageTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.gold,
        fontSize: 26,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
