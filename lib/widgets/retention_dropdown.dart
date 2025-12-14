import 'package:flutter/material.dart';

class RetentionDropdown extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialValue;

  const RetentionDropdown({
    Key? key,
    this.initialValue = 3,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RetentionDropdownState createState() => _RetentionDropdownState();
}

class _RetentionDropdownState extends State<RetentionDropdown> {
  late int _selectedDays;
  final List<int> _retentionOptions = [1, 3, 7, 14, 30, 60, 90];

  @override
  void initState() {
    super.initState();
    _selectedDays = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: _selectedDays,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              items: _retentionOptions.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value ${value == 1 ? 'Day' : 'Days'}'),
                );
              }).toList(),
              onChanged: (int? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedDays = newValue;
                  });
                  widget.onChanged(newValue);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
