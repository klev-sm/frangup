import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required this.currentUser}) : super(key: key);

  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${currentUser!.displayName!}, fala aí seu frango!"),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () async {},
                  child: const Text("Perfil"),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    await GoogleSignIn().signOut();
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text("Sair"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
