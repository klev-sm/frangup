import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseTextField extends StatelessWidget {
   ExerciseTextField({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
          focusedBorder:
          UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffD62823),
            ),
          ),
          enabledBorder:
          UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          )),
      cursorColor: const Color(
        0xffD62823,
      ),
      style: GoogleFonts.figtree(
        color: Colors.white,
        fontSize: 18,
      ),
    )
  }
}
