import 'package:flutter/material.dart';
import 'package:kabutech/base.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Base(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.chevron_left, color: Colors.white),
        ),
        title: const Text("App info"),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Text(
            'This is where the app info will go',
            style: theme.textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
