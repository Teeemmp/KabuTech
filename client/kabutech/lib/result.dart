import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kabutech/base.dart';
import 'package:kabutech/healthy.dart';
import 'package:kabutech/poisonous.dart';
import 'package:kabutech/unhealthy.dart';
import 'package:kabutech/models/analysis.dart';

class Result extends StatefulWidget {
  const Result({super.key, required this.imagePath, required this.analysis});

  final Analysis analysis;
  final String imagePath;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Base(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.chevron_left, color: Colors.white),
        ),
        title: const Text("Result"),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child:
                        Image.file(File(widget.imagePath), fit: BoxFit.cover),
                  ),
                ),
              ),
              _buildDiagnosisItems(widget.analysis, theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiagnosisItems(Analysis analysis, ThemeData theme) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '${(analysis.score * 100).toStringAsFixed(2)}%',
                          style: theme.textTheme.displaySmall,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            analysis.name,
                            style: theme.textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    analysis.description,
                    style: theme.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 20),
                  if (analysis.disease == "" && !analysis.poisonous)
                    const Healthy(),
                  if (analysis.disease != "")
                    Unhealthy(disease: analysis.disease),
                  if (analysis.poisonous) const Poisonous(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
