import "dart:async";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class WorkoutLogPage extends StatefulWidget {
  const WorkoutLogPage({Key? key}) : super(key: key);

  @override
  State<WorkoutLogPage> createState() => _WorkoutLogPageState();
}

class _WorkoutLogPageState extends State<WorkoutLogPage> {
  Timer? _timer;
  int _secondsElapsed = 0;
  bool _isTimerPaused = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (!_isTimerPaused) {
          _secondsElapsed++;
        }
      });
    });
  }

  void pauseTimer() {
    setState(() {
      _isTimerPaused = true;
    });
  }

  void resumeTimer() {
    setState(() {
      _isTimerPaused = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    int hours = _secondsElapsed ~/ 3600;
    int minutes = (_secondsElapsed % 3600) ~/ 60;
    int seconds = _secondsElapsed % 60;

    TextButton cancelButton = TextButton(
      child: const Text("Não, irei continuar"),
      onPressed: () {
        Navigator.pop(context);
        resumeTimer();
      },
    );

    TextButton continueButton = TextButton(
      child: const Text("Sim"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    Future<void> dialogBuilder(BuildContext context) {
      pauseTimer();
      return showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 0,
            title: const Text("Sair do treino?"),
            content: const Text("Já vai desistir assim, seu frango?"),
            actions: [continueButton, cancelButton],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1B1B23),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => dialogBuilder(context),
          icon: const Icon(Icons.close),
        ),
        title: Text(
          '${hours.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}'
          ':${seconds.toString().padLeft(2, "0")}',
          key: ValueKey('timer_text'), // Adicionando uma chave para o widget
          style: GoogleFonts.figtree(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
