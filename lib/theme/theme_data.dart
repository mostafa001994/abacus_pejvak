import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'irsans',
  scaffoldBackgroundColor: Colors.white,

  // استایل فیلدهای ورودی
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(
      color: Color(0xFF2d0408),
      fontSize: 14, // 👈 سایز لیبل مثل حالت اصلی
    ),
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 14, // 👈 سایز hint مثل حالت اصلی
    ),
    floatingLabelStyle: const TextStyle(
      fontSize: 14, // 👈 سایز لیبل شناور مثل حالت اصلی
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF2d0408), width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF2d0408), width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF2d0408), width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  // متن‌ها (فقط رنگ، بدون تغییر سایز کلی)
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Color(0xFF2d0408)),
    bodyLarge: TextStyle(color: Color(0xFF2d0408), fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(color: Color(0xFF2d0408), fontWeight: FontWeight.bold),
  ),

  // دکمه محاسبه
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2d0408),
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  // دکمه پاک کردن
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: const Color(0xFF2d0408),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  ),

  // دکمه اینستاگرام
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(const Color(0xFF2d0408)),
      side: MaterialStateProperty.all(
        const BorderSide(color: Color(0xFF2d0408), width: 2),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'irsans',
  scaffoldBackgroundColor: const Color(0xFF2d0408),

  // استایل فیلدهای ورودی
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    hintStyle: const TextStyle(
      color: Colors.white70,
      fontSize: 14,
    ),
    floatingLabelStyle: const TextStyle(fontSize: 14),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  // متن‌ها (فقط رنگ)
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),

  // دکمه محاسبه
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xff77070b),
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  // دکمه پاک کردن
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0x8e5c1016),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  ),

  // دکمه اینستاگرام
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
      side: MaterialStateProperty.all(BorderSide.none),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  ),
);