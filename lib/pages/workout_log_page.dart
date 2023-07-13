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
  List _exercises = [];

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
          style: GoogleFonts.figtree(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _exercises.isEmpty ?
            Text(
              "Ainda não há exercício aqui, cadastre um.",
              textAlign: TextAlign.center,
              style: GoogleFonts.figtree(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ) :
            SizedBox(
              height: 200,
              child: ListView(
                padding: const EdgeInsets.only(top: 20),
                children:const [
                   Text("É ISSO AÍ")
                ],
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(
                  const Color(0xffD62823),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Exercícios"),
            ),
          ],
        ),
      ),
    );
  }
}
