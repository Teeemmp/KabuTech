import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Poisonous extends StatefulWidget {
  const Poisonous({super.key});

  @override
  State<Poisonous> createState() => _PoisonousState();
}

class _PoisonousState extends State<Poisonous> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Poisonous!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: Lottie.asset(
            'assets/images/poisonous.json',
            filterQuality: FilterQuality.high,
            repeat: true,
          ),
        ),
      ],
    );
  }
}
