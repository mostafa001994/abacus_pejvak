import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculatorResultSection extends StatelessWidget {
  final double result;
  final VoidCallback onReset;
  final VoidCallback onCalculate;

  const CalculatorResultSection({
    super.key,
    required this.result,
    required this.onReset,
    required this.onCalculate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 12),
        ElevatedButton.icon(
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: Colors.white,
          //   foregroundColor: const Color(0xff77070b),
          //   minimumSize: const Size(double.infinity, 50),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          // ),
          icon: const Icon(Icons.calculate, size: 24.0),
          label: const Text('محاسبه', style: TextStyle(fontSize: 18)),
          onPressed: onCalculate,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 36, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'قیمت نهایی:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                  fontSize: 16,
                ),
              ),
              TextButton.icon(
                onPressed: onReset,
                icon: const Icon(Icons.clear, color: Colors.white),
                label: const Text(
                  'پاک کردن',
                  // style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  // backgroundColor: const Color(0x8e5c1016),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          '${NumberFormat("#,##0.##", "fa").format(result)} تومان',
          textAlign: TextAlign.center,
          style: const TextStyle(
            // color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}