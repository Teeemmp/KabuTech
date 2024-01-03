import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Healthy extends StatefulWidget {
  const Healthy({super.key});

  @override
  State<Healthy> createState() => _HealthyState();
}

class _HealthyState extends State<Healthy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Healthy",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: Lottie.asset(
            'assets/images/healthy.json',
            filterQuality: FilterQuality.high,
            repeat: true,
          ),
        ),
      ],
    );
  }
}
