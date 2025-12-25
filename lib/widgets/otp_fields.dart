import 'package:flutter/material.dart';
import 'package:home_ai/utils/colors.dart';

class OtpFields extends StatefulWidget {
  final int length;
  final void Function(String) onChanged;
  final double fieldWidth;
  final double fieldSpacing;

  const OtpFields({
    super.key,
    this.length = 4,
    required this.onChanged,
    this.fieldWidth = 48,
    this.fieldSpacing = 12,
  });

  @override
  State<OtpFields> createState() => _OtpFieldsState();
}

class _OtpFieldsState extends State<OtpFields> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  final List<String> _otp = [];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _otp.addAll(List.filled(widget.length, ''));
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length > 1) {
      // Handle pasted code
      for (int i = 0; i < value.length && (index + i) < widget.length; i++) {
        _otp[index + i] = value[i];
        _controllers[index + i].text = value[i];
      }
      // Move focus to the last field
      if (index + value.length < widget.length) {
        FocusScope.of(context).requestFocus(_focusNodes[index + value.length]);
      }
    } else {
      _otp[index] = value;

      // Move to next field when a digit is entered
      if (value.isNotEmpty && index < widget.length - 1) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
    }

    // Notify parent with the complete OTP
    widget.onChanged(_otp.join());
  }

  void _onBackspace(String value, int index) {
    if (value.isEmpty && index > 0) {
      _otp[index - 1] = '';
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      widget.onChanged(_otp.join());
    } else if (value.isNotEmpty) {
      _otp[index] = value;
      widget.onChanged(_otp.join());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.length, (index) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: widget.fieldSpacing / 2),
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  counterText: '',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: AppColors.alert),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (value) => _onChanged(value, index),
                onSubmitted: (value) {
                  if (index < widget.length - 1) {
                    FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                  }
                },
                onTap: () {
                  // Select all text when tapping on a field
                  _controllers[index].selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: _controllers[index].text.length,
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
