import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kabutech/analyzing.dart';
import 'package:kabutech/failed.dart';
import 'package:kabutech/models/analysis.dart';
import 'package:kabutech/result.dart';
import 'package:kabutech/services/analyzing_service.dart';

class AnalyzePage extends StatefulWidget {
  const AnalyzePage({super.key, required this.imagePath});

  final String imagePath;

  @override
  State<AnalyzePage> createState() => _AnalyzePageState();
}

class _AnalyzePageState extends State<AnalyzePage> {
  var _result = Analysis.empty();

  final client = http.Client();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _analyze(client),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (_result.score == 0) {
            return Failed(
              message: "Unable to classify image.",
              onRetry: () => setState(() {}),
            );
          }
          return Result(
            imagePath: widget.imagePath,
            analysis: _result,
          );
        } else {
          return PopScope(
            child: Analyzing(
              imagePath: widget.imagePath,
              client: client,
            ),
          );
        }
      },
    );
  }

  Future<void> _analyze(http.Client client) async {
    _result = await AnalyzingService().process(widget.imagePath, client);
  }
}
