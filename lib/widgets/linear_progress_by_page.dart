import 'package:flutter/material.dart';

class LinearProgressByPage extends StatefulWidget {
  const LinearProgressByPage({Key? key, required this.currentPage}) : super(key: key);

  final int currentPage;

  @override
  State<LinearProgressByPage> createState() => _LinearProgressByPageState();
}

class _LinearProgressByPageState extends State<LinearProgressByPage> {


  @override
  Widget build(BuildContext context) {
    late int currentPage;
    int totalPages = 4;

    @override
    void initState() {
      currentPage = widget.currentPage;
    }

    void nextPage() {
      setState(() {
        if (widget.currentPage < totalPages) {
          currentPage++;
        }
      });
    }

    void previousPage() {
      setState(() {
        if (widget.currentPage > 1) {
          currentPage--;
        }
      });
    }

    return SizedBox(
      width: 150,
      child: LinearProgressIndicator(
        value: widget.currentPage / totalPages,
        color: Colors.red,
        backgroundColor: const Color(0xFFD9D9D9),
      ),
    );
  }


}
