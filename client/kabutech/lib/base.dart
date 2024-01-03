import 'package:flutter/material.dart';

class Base extends StatelessWidget {
  const Base({super.key, this.appBar, required this.child});

  final Widget? appBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final header = appBar ?? const SizedBox();
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              0.5,
            ],
            colors: [
              Color(0xFFC40608),
              Color(0xFFF8E3E3),
            ],
          ),
        ),
        child: Column(
          children: [header, Expanded(child: child)],
        ));
  }
}
