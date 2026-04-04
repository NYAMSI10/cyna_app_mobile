import 'package:flutter/material.dart';

class SummaryLine extends StatelessWidget {
  const SummaryLine({
    super.key,
    required this.label,
    required this.value,
    this.emphasized = false,
  });

  final String label;
  final String value;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 15,
      fontWeight: emphasized ? FontWeight.w700 : FontWeight.w500,
      color: const Color(0xFF161628),
    );

    return Row(
      children: [
        Text(label, style: style),
        const Spacer(),
        Text(value, style: style),
      ],
    );
  }
}
