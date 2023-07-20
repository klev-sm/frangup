import 'package:flutter/material.dart';
import 'package:frangup/pages/workout_log_page.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  final int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.figtree(
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
              children: const [
                TextSpan(text: "Meus "),
                TextSpan(
                  text: "Treinos",
                  style: TextStyle(
                    color: Color(0xffD62823),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            runSpacing: 7.0,
            children: [
              const Text(
                "Ainda não há treino registrado, ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WorkoutLogPage(),
                    ),
                  );
                },
                child: const Text(
                  "criar um agora",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
