import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1B1B23),
      child: const Center(
        child: CircularProgressIndicator(
          color: Color(0xffD62823),
        ),
      ),
    );
  }
}
