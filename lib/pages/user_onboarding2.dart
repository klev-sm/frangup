import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frangup/pages/home_page.dart';
import 'package:frangup/pages/user_onboarding3.dart';
import 'package:frangup/widgets/linear_progress_by_page.dart';
import 'package:google_fonts/google_fonts.dart';

class UserOnboarding2 extends StatefulWidget {
  const UserOnboarding2({Key? key, required this.currentUser})
      : super(key: key);

  final User currentUser;

  @override
  State<UserOnboarding2> createState() => _UserOnboarding2State();
}

class _UserOnboarding2State extends State<UserOnboarding2> {
  double height = 100.0;
  TextEditingController weightController = TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();
    weightController.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const LinearProgressByPage(currentPage: 2),
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
                      text: "Medidas ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Corporais",
                      style: TextStyle(
                        color: Color(0xffD62823),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Text(
                "...para você ter uma \nexperiência personalizada.",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Altura",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Slider(
                          min: 100,
                          max: 250,
                          divisions: 150,
                          value: height,
                          activeColor: const Color(0xffD62823),
                          inactiveColor: Colors.white,
                          onChanged: (double value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                        Positioned(
                          top: -4,
                          child: Text(
                            "${height.toString()} cm",
                            style: GoogleFonts.figtree(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Peso",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: weightController,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(
                              0xffD62823,
                            ),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                      ),
                      cursorColor: const Color(0xffD62823),
                      textAlign: TextAlign.center,
                      keyboardType: const TextInputType.numberWithOptions(),
                      style: GoogleFonts.figtree(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "kg",
                    style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 25),
                child: TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(widget.currentUser.uid)
                        .update({
                      "height": height,
                      "weight": int.parse(weightController.text)
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserOnboarding3(
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
