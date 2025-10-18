import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class ShinyLogo extends StatefulWidget {
  const ShinyLogo({super.key});

  @override
  State<ShinyLogo> createState() => _ShinyLogoState();
}

class _ShinyLogoState extends State<ShinyLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // بررسی تم فعلی
    final themeMode = Provider.of<ThemeProvider>(context).themeMode;
    final isDark = themeMode == ThemeMode.dark;


    // انتخاب لوگو بر اساس تم
    final logoAsset = isDark ? 'assets/logo_dark.webp' : 'assets/logo_light.webp';

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment(-1 + 2 * _controller.value, 0),
              end: Alignment(1 + 2 * _controller.value, 0),
              colors: [
                Colors.transparent,
                const Color.fromARGB(179, 255, 191, 0),
                Colors.transparent,
              ],
              stops: const [0.2, 0.5, 0.8],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Image.asset(
            logoAsset,
            height: 100,
          ),
        );
      },
    );
  }
}