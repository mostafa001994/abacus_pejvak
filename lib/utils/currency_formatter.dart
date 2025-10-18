import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PersianCurrencyFormatter extends TextInputFormatter {
  final NumberFormat formatter = NumberFormat("#,##0.##", "en");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final raw = newValue.text
        .replaceAll(',', '')
        .replaceAll('٫', '.')
        .replaceAll(RegExp(r'[^\d.]'), '');

    if (raw.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if ('.'.allMatches(raw).length > 1) return oldValue;

    final number = double.tryParse(raw);
    if (number == null) return newValue;

    final formatted = formatter.format(number);
    final diff = formatted.length - raw.length;
    var newOffset = newValue.selection.baseOffset + diff;
    newOffset = newOffset.clamp(0, formatted.length);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: newOffset),
    );
  }
}