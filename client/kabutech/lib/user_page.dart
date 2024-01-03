import 'package:flutter/material.dart';
import 'package:kabutech/base.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Base(
      appBar: AppBar(
        title: const Text("User Info"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Text(
            "This is user info",
            style: theme.textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
