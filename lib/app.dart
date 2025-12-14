import 'package:first_flutter_application/pages/landing_page.dart';
import 'package:first_flutter_application/pages/login_page.dart';
import 'package:first_flutter_application/pages/register_page.dart';
import 'package:first_flutter_application/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dawa2y',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.gold,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
        textTheme: GoogleFonts.tajawalTextTheme(),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale("ar", "AE"),
      supportedLocales: [Locale("ar", "AE")],
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        // '/pharmacist': (context) => const PharmacistPage(),
      },
    );
  }
}
