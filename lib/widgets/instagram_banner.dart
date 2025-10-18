import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramBanner extends StatelessWidget {
  const InstagramBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse('https://www.instagram.com/goldpejvak_fantezi');
        if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0x90F58529),
              Color(0x90DD2A7B),
              Color(0x908134AF),
              Color(0x90515BD4),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(8),
          border: isLight
              ? Border.all(color: const Color(0xFF2d0408), width: 2) // 👈 بوردر رنگ اصلی در لایت
              : null, // 👈 در دارک بدون بوردر
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.link,
              color: isLight ? const Color(0xFF2d0408) : Colors.white, // 👈 رنگ آیکون
            ),
            const SizedBox(width: 8),
            Text(
              'گالری پژواک رو در اینستاگرام دنبال کنید',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isLight ? const Color(0xFF2d0408) : Colors.white, // 👈 رنگ متن
              ),
            ),
          ],
        ),
      ),
    );
  }
}