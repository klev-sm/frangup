import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MealDays extends StatefulWidget {
  const MealDays({Key? key}) : super(key: key);

  @override
  State<MealDays> createState() => _MealDaysState();
}

class _MealDaysState extends State<MealDays> {
  late String onlyMonthAndDay;
  late String currentDay;
  late DateTime currentShowingDate;
  late DateTime now;

  void previousDay(DateTime current) {
    DateTime previousDay = current
        .subtract(
          const Duration(days: 1),
        )
        .toLocal();
    setState(() {
      changeDate(previousDay);
    });
  }

  void nextDay(DateTime current) {
    DateTime nextDay = current
        .add(
          const Duration(days: 1),
        )
        .toLocal();
    setState(() {
      changeDate(nextDay);
    });
  }

  void changeDate(DateTime date) {
    onlyMonthAndDay = DateFormat("dd/MM").format(date);
    currentShowingDate = date;

    if (date.isAtSameMomentAs(now)) {
      currentDay = "Hoje";
    } else if (date.isAfter(now) && date.difference(now).inDays == 1) {
      currentDay = "Amanhã";
    } else if (date.isBefore(now)  && date.difference(now).inDays == -1) {
      currentDay = "Ontem";
    } else {
      currentDay = DateFormat("EEEE", "pt_BR").format(currentShowingDate);
    }
  }

  @override
  void initState() {
    super.initState();
    now = DateTime.now().toLocal();
    currentShowingDate = now;
    onlyMonthAndDay = DateFormat("dd/MM").format(currentShowingDate);
    currentDay = "Hoje";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            DateTime currentPrevious = currentShowingDate;
            previousDay(currentPrevious);
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
                color: const Color(0xffD62823),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              onlyMonthAndDay,
              style: GoogleFonts.figtree(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            DateTime currentNext = currentShowingDate;
            nextDay(currentNext);
          },
          child: const Icon(
            Icons.chevron_right,
            color: Color(0xFFD9D9D9),
          ),
        ),
      ],
    );
  }
}
