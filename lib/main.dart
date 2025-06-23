import 'package:flutter/material.dart';
import 'package:shram_setu_project/pages/auth/auth_page.dart';
import 'package:shram_setu_project/pages/auth/create_account.dart';
import 'package:shram_setu_project/pages/auth/login_page.dart';
import 'package:shram_setu_project/pages/auth/reset_password.dart';
import 'package:shram_setu_project/pages/auth/success_screen.dart';
import 'package:shram_setu_project/pages/language_selection.dart';
import 'package:shram_setu_project/pages/role_selection.dart';
import 'package:shram_setu_project/pages/welcome_page.dart';

void main() => runApp(ShramSetuApp());

class ShramSetuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shram Setu',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF0F0F0), // default backgroud color
        primaryColor: Color(0xFFFF6F00),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFFF6F00),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/language': (context) => LanguageSelectionPage(),
        '/role': (context) => RoleSelectionPage(),
        '/auth': (context) => AuthPage(),
        '/login': (context) => LoginPage(),
        '/create': (context) => CreateAccountPage(),
        '/reset': (context) => ResetPasswordPage(),
        '/success': (context) => SuccessScreen(),
      },
    );
  }
}
