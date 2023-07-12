import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CurrentDay extends StatefulWidget implements PreferredSizeWidget {
  const CurrentDay({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CurrentDay> createState() => _CurrentDayState();
}

class _CurrentDayState extends State<CurrentDay> {
  late String currentDay;
  late DateTime currentDate;

  void nextDay() {
    setState(() {
      currentDate = currentDate.add(
        const Duration(
          days: 1,
        ),
      );
      currentDay = changeCurrentDay(currentDate);
    });
  }

  void previousDay() {
    setState(() {
      currentDate = currentDate.subtract(
        const Duration(days: 1),
      );
      currentDay = changeCurrentDay(currentDate);
    });
  }

  String changeCurrentDay(DateTime date) {
    String day = "Hoje";

    print("date $date");
    print("currentDAte $currentDate");

    final today =
        DateTime(currentDate.year, currentDate.month, currentDate.day);
    final tomorrow =
        DateTime(currentDate.year, currentDate.month, currentDate.day + 1);
    final yesterday =
        DateTime(currentDate.year, currentDate.month, currentDate.day - 1);

    if (date == today) {
      day = "Hoje";
    } else if (date == tomorrow) {
      day = "Amanhã";
    } else if (date == yesterday) {
      day  = "Ontem";
    } else {
      day = DateFormat("EEEE").format(date);
    }

    return day;

  }

  String twoDigitsFormatMonth(DateTime date) {
    String twoDigitsMonth = DateFormat("MM").format(
      DateTime(date.year, date.month, date.day),
    );
    return twoDigitsMonth;
  }

  String twoDigitsFormatDay(DateTime date) {
    String twoDigitsDay = DateFormat("dd").format(
      DateTime(date.year, date.month, date.day),
    );
    return twoDigitsDay;
  }

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    currentDay = "Hoje";
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              previousDay();
            },
            child: const Icon(
              Icons.chevron_left,
              color: Color(0xFFD9D9D9),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(
                currentDay,
                style: GoogleFonts.figtree(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                  "${twoDigitsFormatDay(currentDate)}/${twoDigitsFormatMonth(currentDate)}"),
            ],
          ),
          GestureDetector(
            onTap: () {
              nextDay();
            },
            child: const Icon(
              Icons.chevron_right,
              color: Color(0xFFD9D9D9),
            ),
          ),
        ],
      ),
    );
  }
}
