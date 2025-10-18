double parseFormattedInput(String text) {
  return double.tryParse(
    text
        .replaceAll(',', '')
        .replaceAll('٫', '.')
        .replaceAll(RegExp(r'[^\d.]'), ''),
  ) ?? 0;
}