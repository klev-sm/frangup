import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required this.currentUser}) : super(key: key);

  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            DrawerHeader(
                child: Text(Klevert)
            )
          ],
        )
    );;
  }
}



