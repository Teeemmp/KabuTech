import 'package:kabutech/custom_icons.dart';
import 'package:kabutech/mushroom_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:kabutech/manage_page.dart';
import 'package:kabutech/info_page.dart';
import 'package:kabutech/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Add box decoration
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
            Text(widget.title,
                style: const TextStyle(
                    fontFamily: 'Mushroom',
                    fontSize: 40,
                    color: Color(0xFF5C4029))),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: FAProgressBar(
                currentValue: 30,
                displayText: '%',
                borderRadius: BorderRadius.circular(15),
                progressColor: const Color(0xFF8A613E),
                backgroundColor: const Color(0xFFEFDAC9),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
              // This Row widget is here to align the two icons
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  tooltip: 'App info',
                  icon: const Icon(Icons.info),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const InfoPage(title: 'App Info')))
                  },
                ),
                IconButton(
                  tooltip: 'Manage Mushrooms',
                  icon: const Icon(CustomIcons.mushroom),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ManagePage(title: 'Manage Mushrooms')))
                  },
                ),
                const SizedBox(width: 48),
                IconButton(
                  tooltip: 'New Mushroom',
                  icon: const Icon(CustomIcons.mushroom_add),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MushroomPage(title: 'Add New Mushroom')))
                  },
                ),
                IconButton(
                  tooltip: 'Settings',
                  icon: const Icon(Icons.settings),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SettingsPage(title: 'Settings')))
                  },
                ),
              ])),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => setState(() {}),
        tooltip: 'Check Heath',
        backgroundColor: const Color(0xFFCF925D),
        foregroundColor: Colors.white,
        child: const Icon(CustomIcons.scan, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
