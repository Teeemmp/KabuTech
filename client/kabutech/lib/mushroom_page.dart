import 'package:flutter/material.dart';
import 'package:kabutech/base.dart';

class MushroomPage extends StatelessWidget {
  const MushroomPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Base(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.chevron_left, color: Colors.white),
        ),
        title: Text(title),
      ),
      child: const SingleChildScrollView(
        child: Center(
          child: Text('This is where the add or edit mushroom will go'),
        ),
      ),
    );
  }
}
