import 'package:flutter/material.dart';
import 'package:home_ai/utils/colors.dart';

class MeMeToggleRow extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const MeMeToggleRow({
    super.key,
    required this.title,
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  State<MeMeToggleRow> createState() => _MeMeToggleRowState();
}

class _MeMeToggleRowState extends State<MeMeToggleRow> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Switch(
          value: isOn,
          activeThumbColor: AppColors.primary,
          onChanged: (value) {
            setState(() {
              isOn = value;
            });
            widget.onChanged(value);
          },
        ),
      ],
    );
  }
}
