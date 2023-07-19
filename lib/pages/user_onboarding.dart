import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frangup/pages/home_page.dart';
import 'package:frangup/pages/user_onboarding2.dart';
import 'package:frangup/widgets/linear_progress_by_page.dart';
import 'package:google_fonts/google_fonts.dart';

class UserOnboarding extends StatefulWidget {
  const UserOnboarding({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  State<UserOnboarding> createState() => _UserOnboardingState();
}

class _UserOnboardingState extends State<UserOnboarding> {
  String gender = "F";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const LinearProgressByPage(currentPage: 1),
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
                      text: "Qual é o ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "seu sexo?",
                      style: TextStyle(
                        color: Color(0xffD62823),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Text(
                "Queremos te conhecer melhor...",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = "F";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          width: 128,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: gender == "F"
                                ? const Color(0xffD62823)
                                : const Color(0xFF838383),
                          ),
                          child: Image.asset(
                            "images/Female-01-256.png",
                            height: 30,
                            width: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Fêmea",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = "M";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          width: 128,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: gender == "F"
                                ? const Color(0xFF838383)
                                : const Color(0xffD62823),
                          ),
                          child: Image.asset(
                            "images/Male-01-256-B.png",
                            height: 25,
                            width: 25,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Macho",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 25),
                child: TextButton(
                  onPressed: () async {
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(widget.currentUser.uid)
                        .set({"gender": gender});
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserOnboarding2(
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
                        const Color(0xffD62823)),
                  ),
                  child: Text(
                    "avançar",
                    style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
