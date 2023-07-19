import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frangup/pages/home_page.dart';
import 'package:frangup/widgets/linear_progress_by_page.dart';
import 'package:google_fonts/google_fonts.dart';

class UserOnboarding4 extends StatefulWidget {
  const UserOnboarding4({Key? key, required this.currentUser})
      : super(key: key);

  final User currentUser;

  @override
  State<UserOnboarding4> createState() => _UserOnboarding4State();
}

class _UserOnboarding4State extends State<UserOnboarding4> {
  String selectedLevel = "beginner";
  List levels = ["beginner", "intermediate", "advanced"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const LinearProgressByPage(currentPage: 4),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomePage(currentUser: widget.currentUser),
                ),
              );
            },
            child: Text(
              "PULAR",
              style: GoogleFonts.figtree(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF1B1B23),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(1, 3),
                        )
                      ]),
                  children: const [
                    TextSpan(
                      text: "Qual é a ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "sua meta?",
                      style: TextStyle(
                        color: Color(0xffD62823),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Text(
                "Onde você está atuamente?",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLevel = levels[0];
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: levels[0] == selectedLevel
                          ? const Color(0xffD62823)
                          : Colors.grey,
                      width: 2.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    "Iniciante",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.figtree(
                      color: levels[0] == selectedLevel
                          ? const Color(0xffD62823)
                          : Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    print("$selectedLevel sasda");
                    selectedLevel = levels[1];
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: levels[1] == selectedLevel
                          ? const Color(0xffD62823)
                          : Colors.grey,
                      width: 2.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    "Intermediário",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.figtree(
                      color: levels[1] == selectedLevel
                          ? const Color(0xffD62823)
                          : Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    print("$selectedLevel 456");
                    selectedLevel = levels[2];
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: levels[2] == selectedLevel
                          ? const Color(0xffD62823)
                          : Colors.grey,
                      width: 2.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    "Avançado",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.figtree(
                      color: levels[2] == selectedLevel
                          ? const Color(0xffD62823)
                          : Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 25),
                child: TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(widget.currentUser.uid)
                        .update(
                      {"level": selectedLevel},
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          currentUser: widget.currentUser,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(3.0),
                    shape: MaterialStateProperty.all(LinearBorder.none),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xffD62823),
                    ),
                  ),
                  child: Text(
                    "finalizar",
                    style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
