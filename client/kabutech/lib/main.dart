import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kabutech/base.dart';
import 'home_page.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFC996A),
            secondary: const Color(0xFFC40608)),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) {
          return const Base(
            child: HomePage(),
          );
        },
      ),
    );
  }
}
