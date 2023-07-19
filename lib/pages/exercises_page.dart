import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({Key? key}) : super(key: key);

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.figtree(
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
          children: const [
            TextSpan(text: "Modalidades  "),
            TextSpan(
              text: "de Treino",
              style: TextStyle(
                color: Color(0xffD62823),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
