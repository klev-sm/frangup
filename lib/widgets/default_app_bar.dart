import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar(
      {Key? key,
      required this.title,
      required this.bgColor,
      required this.center})
      : super(key: key);

  final String title;
  final Color bgColor;
  final bool center;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.figtree(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      backgroundColor: bgColor,
      centerTitle: center,
    );
  }
}
