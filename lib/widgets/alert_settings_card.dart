import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';
import 'package:home_ai/utils/colors.dart';

class AlertSettingsCard extends StatefulWidget {
  final double initialSensitivity;
  final String initialAlertType;
  final ValueChanged<double>? onSensitivityChanged;
  final ValueChanged<String>? onAlertTypeChanged;

  const AlertSettingsCard({
    super.key,
    this.initialSensitivity = 0.5,
    this.initialAlertType = 'All',
    this.onSensitivityChanged,
    this.onAlertTypeChanged,
  });

  @override
  _AlertSettingsCardState createState() => _AlertSettingsCardState();
}

class _AlertSettingsCardState extends State<AlertSettingsCard> {
  late double _sensitivity;
  String _alertType = 'All'; // Initialize with default value
  final List<String> _alertTypes = ['Push Notification', 'Event Recording', 'Snapshot '];

  @override
  void initState() {
    super.initState();
    _sensitivity = widget.initialSensitivity;
    _alertType = widget.initialAlertType;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Low", style: AppTextStyles.bodySmall.copyWith(color: AppColors.greyDark)),
            Text("Medium", style: AppTextStyles.bodySmall.copyWith(color: AppColors.greyDark)),
            Text("High", style: AppTextStyles.bodySmall.copyWith(color: AppColors.greyDark)),
          ],
        ),
        const SizedBox(height: 4),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.greyLight,
            trackHeight: 4.0,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
          ),
          child: Slider(
            value: _sensitivity,
            min: 0.0,
            max: 1.0,
            divisions: 4,
            label: _getSensitivityLabel(_sensitivity),
            onChanged: (value) {
              setState(() {
                _sensitivity = value;
              });
              widget.onSensitivityChanged?.call(value);
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            _getSensitivityLabel(_sensitivity),
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text("Alert Type", style: AppTextStyles.heading7),
        
        ..._alertTypes.map((type) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Radio<String>(
                  value: type,
                  groupValue: _alertType,
                  activeColor: AppColors.primary,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _alertType = value;
                      });
                      widget.onAlertTypeChanged?.call(value);
                    }
                  },
                ),
                Text(
                  type,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.greyDark,
                    fontWeight: _alertType == type ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  String _getSensitivityLabel(double value) {
    if (value <= 0.25) return 'Low';
    if (value <= 0.5) return 'Medium';
    if (value <= 0.75) return 'High';
    return 'Very High';
  }
}