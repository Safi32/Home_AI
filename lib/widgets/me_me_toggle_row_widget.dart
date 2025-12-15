import 'package:flutter/material.dart';
import 'package:home_ai/utils/colors.dart';

class MeMeToggleRow extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final String? subTitle;

  const MeMeToggleRow({
    super.key,
    required this.title,
    this.subTitle,
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
        Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (widget.subTitle != null)
              Text(
                widget.subTitle!,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
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
