import 'package:flutter/material.dart';
import 'package:frangup/authentication.dart';
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
                const SizedBox(height: 25),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  padding: const EdgeInsets.only(left: 10),
                  height: 40,
                  child: Center(
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.name,
                      cursorColor: const Color(0xFFD62823),
                      autofocus: false,
                      decoration: const InputDecoration.collapsed(
                        hintText: "Usuário",
                      ),
                      style: GoogleFonts.figtree(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  padding: const EdgeInsets.only(left: 10),
                  child: Center(
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.name,
                      cursorColor: const Color(0xFFD62823),
                      autofocus: false,
                      decoration: const InputDecoration.collapsed(
                        hintText: "Senha",
                      ),
                      style: GoogleFonts.figtree(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFFD62823),
                      ),
                    ),
                    child: Text(
                      "Acessar".toUpperCase(),
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Criar Conta",
                            style: GoogleFonts.figtree(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Esqueci a Senha",
                            style: GoogleFonts.figtree(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    final a = signInWithGoogle();
                    print(a);
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
                          child: const Text(
                            "Login com Google",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
