import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Unhealthy extends StatefulWidget {
  const Unhealthy({super.key, required this.disease});

  final String disease;

  @override
  State<Unhealthy> createState() => _UnhealthyState();
}

class _UnhealthyState extends State<Unhealthy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            widget.disease,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: Lottie.asset(
            'assets/images/unhealthy.json',
            filterQuality: FilterQuality.high,
            repeat: true,
          ),
        ),
      ],
    );
  }
}
