import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabutech/analyze_page.dart';
import 'package:kabutech/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:kabutech/manage_page.dart';
import 'package:kabutech/info_page.dart';
import 'package:kabutech/settings_page.dart';
import 'package:kabutech/toast.dart';
import 'package:kabutech/user_page.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    ToastContext().init(context);
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
    final secondary = theme.colorScheme.secondary;
    const iconColor = Color(0xFFF8E3E3);

    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "KabuTech",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Mushroom',
                          fontSize: 45,
                          color: secondary),
                    ),
                    SizedBox(
                      height: 250,
                      child: Lottie.asset(
                        'assets/images/home.json',
                        filterQuality: FilterQuality.high,
                        controller: _controller,
                        onLoaded: (composition) {
                          _controller
                            ..duration = composition.duration
                            ..forward();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              decoration: BoxDecoration(color: secondary.withOpacity(0.5)),
              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    tooltip: 'App info',
                    icon: const Icon(Icons.info, color: iconColor),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoPage()))
                    },
                  ),
                  IconButton(
                    tooltip: 'Manage Mushrooms',
                    icon: const Icon(
                      CustomIcons.mushroom,
                      size: 20,
                      color: iconColor,
                    ),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ManagePage()))
                    },
                  ),
                  IconButton(
                    tooltip: 'Scan Mushroom',
                    icon: const Icon(
                      CustomIcons.scan,
                      size: 32,
                      color: iconColor,
                    ),
                    onPressed: () => pickImage(ImageSource.camera),
                  ),
                  IconButton(
                    tooltip: 'User Info',
                    icon: const Icon(
                      Icons.account_circle,
                      color: iconColor,
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserPage(),
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Settings',
                    icon: const Icon(
                      Icons.settings,
                      color: iconColor,
                    ),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()))
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> pickImage(ImageSource source) async {
    if (defaultTargetPlatform != TargetPlatform.android &&
        defaultTargetPlatform != TargetPlatform.iOS) {
      Toast.showError("Unsupported platform.", position: ToastPosition.center);
      return;
    }
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);

    if (image == null) return;

    if (context.mounted) showClassifyPage(image.path);
  }

  void showClassifyPage(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnalyzePage(imagePath: imagePath),
      ),
    );
  }
}
