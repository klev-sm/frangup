import "dart:async";
import "dart:convert";

import "package:flutter/material.dart";
import "package:frangup/pages/exercise_page.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:http/http.dart' as http;

class WorkoutLogPage extends StatefulWidget {
  const WorkoutLogPage({Key? key}) : super(key: key);

  @override
  State<WorkoutLogPage> createState() => _WorkoutLogPageState();
}

class _WorkoutLogPageState extends State<WorkoutLogPage> {
  Timer? _timer;
  int _secondsElapsed = 0;
  bool _isTimerPaused = false;
  List _selectedExercises = [];
  List<Map<String, dynamic>> _filteredExercises = [];
  List<Map<String, dynamic>> _allExercises = [];

  final TextEditingController _searchController = TextEditingController();

  void _filterExercises(String searchText) {
   if(_filteredExercises.isEmpty) {
     _filteredExercises = List.from(_allExercises);
   } else {
     setState(() {
       _filteredExercises = _allExercises
           .where((exercise) =>
           exercise["name"].toLowerCase().contains(searchText.toLowerCase()))
           .toList();
     });
   }
  }

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
            _selectedExercises.isEmpty
                ? Text(
                    "Ainda não há exercício aqui, cadastre um.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.figtree(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                : SizedBox(
                    height: 200,
                    child: ListView(
                      padding: const EdgeInsets.only(top: 20),
                      children: const [Text("É ISSO AÍ")],
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color?>(
                  const Color(0xffD62823),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Adicionar Treino",
                            style: GoogleFonts.figtree(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15),
                            child: TextField(
                              controller: _searchController,
                              onChanged: _filterExercises,
                              cursorColor: Colors.white,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Pesquisar exercício',
                                hintStyle:
                                    const TextStyle(color: Colors.white54),
                                prefixIcon: const Icon(Icons.search,
                                    color: Colors.white),
                                filled: true,
                                fillColor: Colors.grey[800],
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey[800]!),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey[800]!),
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                          FutureBuilder(
                            future: fetchDataFromAPI(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                case ConnectionState.none:
                                  return const CircularProgressIndicator();
                                case ConnectionState.done:
                                  return Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _filteredExercises.length,
                                      itemBuilder: (context, index) {
                                        if (index < _filteredExercises.length) {
                                          var item = _filteredExercises[index];
                                          return ListTile(
                                            title: Text(item['name']),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => ExercisePage(
                                                    title: item["name"],
                                                    image: item["demo"],
                                                    description: item["description"],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  );
                                default:
                                  return const Text("Error! No data found");
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text("Exercícios"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchDataFromAPI() async {
    final response = await http.get(
      Uri(scheme: "http", host: "10.0.2.2", path: "/exercises", port: 3333),
    );
    if (response.statusCode == 200) {
      _allExercises = List<Map<String, dynamic>>.from(json.decode(response.body));
      setState(() {
        _filteredExercises = List.from(_allExercises);
      });
    } else {
      throw Exception("Failed to load data from API");
    }
  }
}
