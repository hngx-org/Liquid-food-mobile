import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/text_style.dart';

class RefactoredForm extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final FocusNode focusNode;
  final bool showDropdownIcon;
  final List<TextInputFormatter>? inputFormatter;
  final bool isNumeric;
  final int? maxLength;
  final bool isDropdown; // New property for indicating it's a dropdown
  final String? dropdownValue; // Value for the selected item
  final ValueChanged<String?>? onChanged; // Callback for when the dropdown value changes
  final List<DropdownMenuItem<String>>? dropdownItems;
  final VoidCallback? onDropdownPressed;



  RefactoredForm(
      {required this.controller,
        required this.label,
        required this.hintText,
        required this.focusNode,
        required this.showDropdownIcon,
        this.inputFormatter,
        required this.isNumeric,
        this.maxLength,
        this.isDropdown = false, // Default value is false
        this.dropdownValue,
        this.onChanged,
        this.dropdownItems,
        this.onDropdownPressed,

      });

  @override
  _RefactoredFormState createState() => _RefactoredFormState();
}

class _RefactoredFormState extends State<RefactoredForm> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = widget.focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _handleTap();
          },
          child: Text(
              widget.label,
              style: _isFocused ? AppTextStyle.activeFormLabel : AppTextStyle.inactiveFormLabel
          ),
        ),
        SizedBox(height: 10.0),
        Form(
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            onTap: () {
              _handleTap();
            },
            inputFormatters: widget.isNumeric
            ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
                : widget.inputFormatter,
            keyboardType: widget.isNumeric
                ? TextInputType.number // Set numeric keyboard type conditionally
                : TextInputType.text,
            decoration: InputDecoration(

              counterText: "",
              hintText: widget.hintText,
              contentPadding:
              EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              suffixIcon: widget.showDropdownIcon ?
              DropdownButtonFormField<String>(
                elevation: 0,
                padding: EdgeInsets.only(left: 5),
                value: widget.dropdownValue,
                onChanged: widget.onChanged,
                items: widget.dropdownItems,

              )
                  : null,
            ),
            maxLength: widget.maxLength,
          ),
        ),
      ],
    );
  }

  void _handleTap() {
    setState(() {
      _isFocused = true;
      widget.focusNode.requestFocus();
    });
  }
}
