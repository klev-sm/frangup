import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key, required this.title, required this.image,  required this.description})
      : super(key: key);

  final String title;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1B1B23),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1B1B23),
          title: Text(
            title,
            style: GoogleFonts.figtree(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "http://10.0.2.2:3333/exercise/demo/$image",
                fit: BoxFit.contain,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Descrição",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.figtree(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                      color: const Color(0xffD62823)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.figtree(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white
                  ),),
              )
            ],
          ),
        ));
  }
}
