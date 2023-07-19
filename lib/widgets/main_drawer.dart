import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frangup/pages/home_page.dart';
import 'package:frangup/pages/login_page.dart';
import 'package:frangup/pages/profile_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  Future<GoogleSignInAccount?> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

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
                Text("${currentUser.displayName!}, fala aí seu frango!"),
                const Divider(),
                InkWell(
                  onTap: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          currentUser: currentUser,
                        ),
                      ),
                    );
                  },
                  child: const Text("Início"),
                ),
                const Divider(),
                InkWell(
                  onTap: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          currentUser: currentUser,
                        ),
                      ),
                    );
                  },
                  child: const Text("Perfil"),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
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
