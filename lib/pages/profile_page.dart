import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frangup/widgets/default_app_bar.dart';
import 'package:frangup/widgets/main_drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(currentUser: currentUser),
      backgroundColor: const Color(0xFF1B1B23),
      appBar: const DefaultAppBar(
        title: "Perfil",
        bgColor: Colors.transparent,
        center: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 50,
              child: Image.network(currentUser!.photoURL!),
            )
          ],
        ),
      ),
    );
  }
}
