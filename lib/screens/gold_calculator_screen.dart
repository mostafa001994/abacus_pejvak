import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart' as flutter;
import '../theme/theme_provider.dart';
import '../utils/currency_formatter.dart';
import '../utils/parser.dart';
import '../widgets/shiny_logo.dart';
import '../widgets/instagram_banner.dart';
import '../widgets/calculator_result_section.dart';
import '../widgets/theme_switcher_button.dart';

class GoldCalculatorScreen extends StatefulWidget {
  const GoldCalculatorScreen({super.key});

  @override
  State<GoldCalculatorScreen> createState() => _GoldCalculatorScreenState();
}

class _GoldCalculatorScreenState extends State<GoldCalculatorScreen> {
  final priceController = TextEditingController();
  final wageController = TextEditingController();
  final profitController = TextEditingController();
  final taxController = TextEditingController();
  final weightController = TextEditingController();

  double result = 0;

  void calculatePrice() {
    double price = parseFormattedInput(priceController.text);
    double wage = double.tryParse(wageController.text) ?? 0;
    double profit = double.tryParse(profitController.text) ?? 0;
    double tax = double.tryParse(taxController.text) ?? 0;
    double weight = parseFormattedInput(weightController.text);

    double base = price * weight;
    double wageAmount = base * wage / 100;
    double profitAmount = (base + wageAmount) * profit / 100;
    double taxAmount = (base + wageAmount + profitAmount) * tax / 100;

    setState(() {
      result = base + wageAmount + profitAmount + taxAmount;
    });
  }

  void resetFields() {
    priceController.clear();
    wageController.clear();
    profitController.clear();
    taxController.clear();
    weightController.clear();
    setState(() {
      result = 0;
    });
  }

  Widget buildTextField(String label, TextEditingController controller) {
    final needsFormatter = label == 'قیمت هر گرم طلا' || label.contains('وزن');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: needsFormatter ? [PersianCurrencyFormatter()] : [],
        textAlign: TextAlign.right, // 👈 متن داخل فیلد راست‌چین
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true, // 👈 لیبل هم راست‌چین
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality( // 👈 کل صفحه راست‌چین
        textDirection: flutter.TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                const ShinyLogo(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        buildTextField('قیمت هر گرم طلا', priceController),
                        buildTextField('درصد اجرت', wageController),
                        buildTextField('درصد سود', profitController),
                        buildTextField('درصد مالیات', taxController),
                        buildTextField('وزن (گرم)', weightController),

                        // 👉 بخش محاسبه و نمایش نتیجه
                        CalculatorResultSection(
                          result: result,
                          onReset: resetFields,
                          onCalculate: calculatePrice,
                        ),

                        const SizedBox(height: 30),
                        const InstagramBanner(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // 👉 دکمه تغییر تم پایین سمت راست
            const Positioned(
              bottom: 20,
              right: 20,
              child: ThemeSwitcherButton(),
            ),
          ],
        ),
      ),
    );
  }
}