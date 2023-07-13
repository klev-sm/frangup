import 'package:flutter/material.dart';
import 'package:frangup/widgets/meal_days.dart';
import 'package:google_fonts/google_fonts.dart';

class DietPage extends StatelessWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MealDays(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.figtree(
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
              children: const [
                TextSpan(text: "Refeições "),
                TextSpan(
                  text: "Do Dia",
                  style: TextStyle(
                    color: Color(0xffD62823),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ExpansionTile(
                  collapsedBackgroundColor: const Color(0xffD62823),
                  leading: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  title: Text(
                    "café da manhã",
                    style: GoogleFonts.figtree(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  backgroundColor: const Color(0xffD62823),
                  textColor: Colors.white,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.bottomLeft,
                      color: const Color(0xFFD9D9D9),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "ADICIONAR ALIMENTO",
                          style: GoogleFonts.figtree(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1B1B23),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                ExpansionTile(
                  collapsedBackgroundColor: const Color(0xffD62823),
                  leading: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  title: Text(
                    "almoço",
                    style: GoogleFonts.figtree(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  backgroundColor: const Color(0xffD62823),
                  textColor: Colors.white,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.bottomLeft,
                      color: const Color(0xFFD9D9D9),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "ADICIONAR ALIMENTO",
                          style: GoogleFonts.figtree(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1B1B23),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                ExpansionTile(
                  collapsedBackgroundColor: const Color(0xffD62823),
                  leading: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  title: Text(
                    "lanche",
                    style: GoogleFonts.figtree(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  backgroundColor: const Color(0xffD62823),
                  textColor: Colors.white,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.bottomLeft,
                      color: const Color(0xFFD9D9D9),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "ADICIONAR ALIMENTO",
                          style: GoogleFonts.figtree(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1B1B23),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                ExpansionTile(
                  collapsedBackgroundColor: const Color(0xffD62823),
                  leading: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  title: Text(
                    "jantar",
                    style: GoogleFonts.figtree(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  backgroundColor: const Color(0xffD62823),
                  textColor: Colors.white,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.bottomLeft,
                      color: const Color(0xFFD9D9D9),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "ADICIONAR ALIMENTO",
                          style: GoogleFonts.figtree(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1B1B23),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )
      ],
    );
  }
}
