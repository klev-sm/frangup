import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frangup/authentication.dart';
import 'package:frangup/pages/home_page.dart';
import 'package:frangup/pages/user_onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/optimized_bg_login.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color(0xFF1B1B23).withOpacity(0.85),
                    BlendMode.srcOver,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  child: Image.asset(
                    "images/frangup_logo_sem_fundo.png",
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      shadows: [
                        Shadow(
                          color: const Color(0xFF000000).withOpacity(0.5),
                          offset: const Offset(1, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    children: const [
                      TextSpan(
                        text: " Seja ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: "Bem-Vindo!",
                        style: TextStyle(
                          color: Color(0xFFD62823),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    UserCredential userCredential = await signInWithGoogle();
                    if (context.mounted) {
                      if (userCredential.additionalUserInfo!.isNewUser) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserOnboarding(
                              currentUser: userCredential.user!,
                            ),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomePage(currentUser: userCredential.user!),
                          ),
                        );
                      }
                    }
                  },
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Image.asset("images/google_logo.png"),
                        ),
                        Container(
                          color: const Color(0xFF393944),
                          width: 150,
                          alignment: Alignment.center,
                          child: Text(
                            "Login com Google",
                            style: GoogleFonts.figtree(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Entrar como convidado",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
