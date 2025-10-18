import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return PopupMenuButton<ThemeMode>(
      icon: const Icon(Icons.brightness_6),
      onSelected: (mode) {
        themeProvider.setThemeMode(mode);
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: ThemeMode.light,
          child: Text('روشن'),
        ),
        PopupMenuItem(
          value: ThemeMode.dark,
          child: Text('تاریک'),
        ),
      ],
    );
  }
}