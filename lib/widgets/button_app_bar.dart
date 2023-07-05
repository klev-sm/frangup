import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAppBar extends StatelessWidget {
  const ButtonAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
    );
  }
}
