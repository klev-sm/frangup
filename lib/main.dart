import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frangup/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}