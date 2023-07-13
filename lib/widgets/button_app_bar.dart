import 'package:flutter/material.dart';
import 'package:frangup/pages/workout_log_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ButtonAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WorkoutLogPage(),
            ),
          );
        },
        child: Text(
          "iniciar treino vazio",
          style: GoogleFonts.figtree(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
    );
  }
}
