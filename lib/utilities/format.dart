import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  static const _defaultDouble = 0.0;

  // This regex only allows a single dot to be entered
  static final _regExp = RegExp(r'^(\d+)?(\.)?(\d+)?$');

  DecimalTextInputFormatter({double initialValue = _defaultDouble})
      : assert(initialValue != null),
        _template = initialValue.toStringAsFixed(1);

  final String _template;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_regExp.hasMatch(newValue.text)) {
      final selectionIndex = newValue.selection.end;
      final parts = newValue.text.split('.');

      String newText;
      if (parts.length > 1) {
        newText = '${parts[0]}.${parts[1].substring(0, 1)}';
      } else {
        newText = parts[0];
      }

      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(
          offset: selectionIndex + newText.length - newValue.text.length,
        ),
      );
    } else {
      return oldValue;
    }
  }
}
