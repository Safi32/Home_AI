import 'package:flutter/material.dart';
import 'package:home_ai/constants/text_styles.dart';

class CameraSetting extends StatelessWidget {
  const CameraSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Camera Settings",
                      style: TextStyle(
                        fontSize: AppTextStyles.heading4.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Opacity(opacity: 0, child: Icon(Icons.arrow_back)),
              ],
            ),
            const SizedBox(height: 32),
            SwipeToggleRow(
              label: "Video Quality",
              options: ["720p", "1080p", "2K"],
              initialIndex: 1,
            ),
            const SizedBox(height: 24),
            SwipeToggleRow(
              label: "Night Vision Mode",
              options: ["On", "Auto", "Off"],
              initialIndex: 1,
            ),
            const SizedBox(height: 24),
            SwipeToggleRow(
              label: "Recording Mode",
              options: ["On", "Auto", "Off"],
              initialIndex: 1,
            ),
            const SizedBox(height: 24),
            SwipeToggleRow(
              label: "Motion Sensitivity",
              options: ["Low", "Medium", "High"],
              initialIndex: 1,
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Storage Settings",
                style: TextStyle(
                  fontSize: AppTextStyles.heading7.fontSize,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0F1A2E),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}



class SwipeToggleRow extends StatefulWidget {
  final String label;
  final List<String> options;
  final int initialIndex;

  const SwipeToggleRow({
    required this.label,
    required this.options,
    this.initialIndex = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<SwipeToggleRow> createState() => _SwipeToggleRowState();
}

class _SwipeToggleRowState extends State<SwipeToggleRow> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: AppTextStyles.heading7.fontSize,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F1A2E),
            ),
          ),
        ),
        _AnimatedToggle(
          options: widget.options,
          selectedIndex: selectedIndex,
          onChanged: (i) => setState(() => selectedIndex = i),
        ),
      ],
    );
  }
}

class _AnimatedToggle extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _AnimatedToggle({
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = 65.0;  
        final height = 30.0; 
        return Container(
          width: width * options.length,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F5F9),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                left: selectedIndex * width,
                duration: const Duration(milliseconds: 220),
                curve: Curves.ease,
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F1A2E),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              Row(
                children: List.generate(options.length, (i) {
                  final isSelected = i == selectedIndex;
                  return GestureDetector(
                    onTap: () => onChanged(i),
                    child: SizedBox(
                      width: width,
                      height: height,
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 220),
                          style: TextStyle(
                            color: isSelected ? Colors.white : const Color(0xFF0F1A2E),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          child: Text(options[i]),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
