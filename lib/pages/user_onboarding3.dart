import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frangup/pages/home_page.dart';
import 'package:frangup/pages/user_onboarding4.dart';
import 'package:frangup/widgets/linear_progress_by_page.dart';
import 'package:google_fonts/google_fonts.dart';

class UserOnboarding3 extends StatefulWidget {
  const UserOnboarding3({Key? key, required this.currentUser})
      : super(key: key);

  final User currentUser;

  @override
  State<UserOnboarding3> createState() => _UserOnboarding3State();
}

class _UserOnboarding3State extends State<UserOnboarding3> {

  String selectedGoal = "lose weight";
  List goals = [
    "lose weight",
    "be healthier",
    "improve mass"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const LinearProgressByPage(currentPage: 3),
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
                "Deixe que a gente te ajuda.",
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
                    selectedGoal = goals[0];
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: goals[0] == selectedGoal ? const Color(0xffD62823) :  Colors.grey,
                      width: 2.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Perder peso",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.figtree(
                          color: goals[0] == selectedGoal ? const Color(0xffD62823) :  Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                       SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          goals[0] == selectedGoal ? "images/fire-red.png" :  "images/fire-white.png",
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGoal = goals[1];
                  });
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: goals[1] == selectedGoal ? const Color(0xffD62823) :  Colors.grey,
                      width: 2.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ser + Saudável",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.figtree(
                          color: goals[1] == selectedGoal ? const Color(0xffD62823) :  Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          goals[1] == selectedGoal ? "images/heart-red.png" :  "images/heart-white.png",
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGoal = goals[2];
                  });
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  margin:
                  const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: goals[2] == selectedGoal ? const Color(0xffD62823) :  Colors.grey,
                      width: 2.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ganhar Músculo",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.figtree(
                          color: goals[2] == selectedGoal ? const Color(0xffD62823) :  Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          goals[2] == selectedGoal ? "images/dumbbells-red.png" :  "images/dumbbells-white.png",
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
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
                        .update({"goal": selectedGoal});
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserOnboarding4(
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
                    "avançar",
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
