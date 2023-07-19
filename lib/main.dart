import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frangup/pages/home_page.dart';
import 'package:frangup/pages/login_page.dart';
import 'package:frangup/pages/splash_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting("pt_BR");

  runApp(MaterialApp(
    home: FutureBuilder<User?>(
      future: checkCurrentUserStatus(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          if(snapshot.hasData) {
            if(snapshot.data != null) {
              return HomePage(currentUser: snapshot.data!);
            } else {
              return const LoginPage();
            }
          } else {
            return const LoginPage();
          }
        }
      },
    ),
  ));
}

Future<User?> checkCurrentUserStatus() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = auth.currentUser;

  if (currentUser != null) {
    return currentUser;
  } else {
    return null;
  }
}
