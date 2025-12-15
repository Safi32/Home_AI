import 'package:flutter/material.dart';
import 'package:home_ai/utils/colors.dart';

class CustomDropdownTile extends StatefulWidget {
  final String label;
  final List<String> options;
  final String selectedOption;
  final Function(String) onChanged;

  const CustomDropdownTile({super.key, 
    required this.label,
    required this.options,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  _CustomDropdownTileState createState() => _CustomDropdownTileState();
}

class _CustomDropdownTileState extends State<CustomDropdownTile> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOption = newValue!;
                    });
                    widget.onChanged(newValue!);
                  },
                  items: widget.options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}