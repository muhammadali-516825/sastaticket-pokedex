import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AuthTextField extends StatelessWidget {
  final String hint;
  final ValueChanged<String?> onChanged;
  final TextInputType keyboardType;
  final bool isPasswordField;
  final bool isRequiredField;
  final String? error;
  final EdgeInsets padding;
  final String name;
  final String? Function(String?)? validator;

  const AuthTextField({
    Key? key,
    this.hint = '',
    required this.onChanged,
    required this.keyboardType,
    this.isPasswordField = false,
    this.isRequiredField = false,
    this.error,
    this.padding = const EdgeInsets.all(0),
    required this.name,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder border =
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent, width: 2));
    UnderlineInputBorder errorBorder =
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent, width: 2));
    return Padding(
      padding: padding,
      child: FormBuilderTextField(
        name: name,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          fillColor: Colors.white10,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          filled: true,
          hintText: isRequiredField ? '$hint*' : hint,
          border: border,
          disabledBorder: border,
          enabledBorder: border,
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
          errorText: error,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        autocorrect: false,
        textInputAction: TextInputAction.done,
        obscureText: isPasswordField,
        maxLines: 1,
        onChanged: onChanged,
      ),
    );
  }
}
