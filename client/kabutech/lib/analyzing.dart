import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kabutech/base.dart';
import 'package:lottie/lottie.dart';

class Analyzing extends StatelessWidget {
  const Analyzing({super.key, required this.imagePath, required this.client});

  final String imagePath;
  final http.Client client;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.secondary;

    return Base(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: Lottie.asset(
                'assets/images/home.json',
                animate: true,
                fit: BoxFit.fill,
                repeat: true,
              ),
            ),
            Text(
              "Classifying...",
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                client.close();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(accent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(120, 50))),
              icon: const Icon(Icons.stop_rounded),
              label: const Text(
                "Cancel",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
