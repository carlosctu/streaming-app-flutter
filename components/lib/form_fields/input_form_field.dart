import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?) validator;
  final Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const InputFormField({
    super.key,
    this.controller,
    required this.labelText,
    required this.validator,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xff3EA1D2),
            ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: prefixIcon != null ? prefixIcon! : const SizedBox.shrink(),
          ),
          Flexible(
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: labelText,
                suffixIcon: suffixIcon,
                focusColor: Colors.red,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff3EA1D2),
                  ),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
