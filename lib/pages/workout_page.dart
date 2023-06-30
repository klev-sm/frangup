import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B23),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: TextButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(3.0),
            shape: MaterialStateProperty.all(LinearBorder.none),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 30),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          onPressed: () {},
          child: Text(
            "iniciar treino vazio",
            style: GoogleFonts.figtree(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: 1,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            label: "Exercícios",
            icon: Icon(
                Icons.schedule,
                color: Colors.white
            ),
          ),
          BottomNavigationBarItem(
            label: "Treino",
            icon: Icon(
                Icons.fitness_center,
                color: Colors.red
            ),
          ),
          BottomNavigationBarItem(
            label: "Nutrição",
            icon: Icon(
                Icons.restaurant,
                color: Colors.white
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
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
                        style: TextStyle(color: Color(0xffD62823))),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
